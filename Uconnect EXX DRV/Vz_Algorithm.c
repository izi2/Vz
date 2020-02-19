#include "PIC_DRV_Uconnect.h"
#include "VZ_Sensor.h"
#include "Debug_Drv.h"
#include "Vz_Algorithm.h"
#include "config_sensor.h"
//#include "Types.h"
//#include "config_sensor.h"

#define DEBUG_MODE
extern int volatile Vz_Sensor_Velocity_Buffer_int[];
extern int volatile Vz_Sensor_Distance_Buffer_int[];
extern int_16 volatile ParamsIn[];
extern uint_8 volatile ALGO_SELECTED;
//*****************************************************************************************************

void Vz_Algoritem_by_algo_select()
{
    switch (ALGO_SELECTED)
    {
        case Algorithm_2:
            Vz_Algorithm_2();
            break;
        case Algorithm_3_4:
            Vz_Algorithm_3_4();
            break;
        case Algorithm_5:
            Vz_Algorithm_5();
            break;
    }
}
void Vz_Algorithm_5(void)
{
    ///  Run Time = 400uSEC
   #ifdef DEBUG_MODE
      char txt[100];
   #endif
//   int SPC = ParamsIn[SPC5]
//   int Yv_th = ParamsIn[Yv_th5]
//   int FilterLength = ParamsIn[FilterLength5]
//   int FilterLengthShort = ParamsIn[FilterLengthShort5]
//   int SwitchN = ParamsIn[SwitchN5]
//   int alpha = ParamsIn[alpha5]
//   int DToBelt = ParamsIn[DToBelt5]
//   int Error2_th = ParamsIn[Error2_th5]
//   int Error2_N = ParamsIn[Error2_N5]
    //uError_Algo5             //Parametr OUT  see function
//    static int DeltaT=ParamsOut[DeltaT5];        //Parametr OUT
//    static int ChBHight=ParamsOut[ChBHight5];      //Parametr OUT
//    static int ST=ParamsOut[ST5];      //Parametr OUT
//    static int a=ParamsOut[a5];      //Parametr OUT
//    static int ErorCode=ParamsOut[ErorCode5];      //Parametr OUT


    int SPC=8000;               //Parametr IN
   int Yv_th=1700;             //Parametr IN
   int FilterLength=30;        //Parametr IN
   int FilterLengthShort=18;   //Parametr IN
   int SwitchN=0;              //Parametr IN
   int alpha=500;              //Parametr IN
   static int DToBelt=6400;    //Parametr IN/OUT
   int Error2_th=12;           //Parametr IN
   int Error2_N=5;             //Parametr IN
   // uError_Algo5             //Parametr OUT  see function
   static int DeltaT=0;        //Parametr OUT
   static int ChBHight=0;      //Parametr OUT
   
   static int DXpoint=0;
   static int DXpointLast=0;
   static int UIpoint=0;
   static int DIpoint=0;
   static int UXpoint=0;
   static int UXpointLast=0;
   
   static int dC=0;
   static int C0=0;
   static int C1=0;
   static int C2=0;
   static int ST=2;

   int FilterDelta;
   int SPCC;
   static int FilterBuffer[Algo5_FilterBuffer_Length]={0},PointerIndex=0;
   int Y,k,j,Yf,Yfs;
   
   OpticDataGetFrame_DistanceOnly();

   SPCC=SPC/60;
   FilterDelta=FilterLength-FilterLengthShort-1;
   if(SwitchN==0) SwitchN=(FilterDelta+1)/2;
   if(DIpoint==0) DIpoint=DToBelt;

   Y=0;
   for(k=0;k<60;k++) Y+=Vz_Sensor_Distance_Buffer_int[k]/60;
   FilterBuffer[PointerIndex]=Y;
   k=0;Yf=0;Yfs=0;
   for(j=0;j<FilterLength;j++)
   {
      if((PointerIndex+j)>(FilterLength-1)) k=PointerIndex+j-FilterLength;
      else k=PointerIndex+j;
      Yf+=FilterBuffer[k]/FilterLength;
      if(j>FilterDelta) Yfs+=FilterBuffer[k]/FilterLengthShort;
   }
   PointerIndex++;
   if(PointerIndex>=FilterLength)  PointerIndex=0;
   dC++;
   switch (ST)
   {
          case    2:
                    if(Yfs<(DToBelt-Yv_th))
                    {
                      C0++;C1=0;
                      if(C0>(SwitchN+SPCC)) uError_Algo5(&ST,&dC,&C0,&C1,1);
                    }
                    else if(Yfs>(Error2_th*(DToBelt/10)))
                    {
                         C2++;
                         if(C2>(Error2_N*SwitchN)) uError_Algo5(&ST,&dC,&C0,&C1,2);
                    }
                    else
                    {
                         C1++;C0=0;
                         if(C1>SwitchN) 
                         {
                           ST=1;C2=0;UIpoint=0;dC=0;
                         }
                    }
          break;
          case    0:
                    if(Yfs<(DToBelt-Yv_th))
                    {
                       C0++;C1=0;
                       if(C0>(SwitchN+SPCC)) uError_Algo5(&ST,&dC,&C0,&C1,1);
                       if((DToBelt-Yf)>(DToBelt-DIpoint))
                       {
                         DIpoint=Yf;DXpoint=dC;
                       }
                    }
                    else if(Yfs>(Error2_th*(DToBelt/10)))
                    {
                        C2++;
                        if(C2>(Error2_N*SwitchN)) uError_Algo5(&ST,&dC,&C0,&C1,2);
                    }
                    else
                    {
                         C1++;C0=0;
                         if(C1>SwitchN)
                         {
                            ST=1;
                            C2=0;
                            ///E N D  O F  C Y C L E
                            DeltaT=DXpoint+DXpointLast;
                            DXpointLast=dC-DXpoint;
                            ChBHight=DToBelt-DIpoint;
                            DToBelt=(int)((float)(((float)((10000.0-(float)alpha)*(float)DToBelt)+(float)((float)alpha*(float)UIpoint))/10000.0));
                            #ifdef DEBUG_MODE
                             sprintf(txt,"%d,%d,%d\n",DeltaT,ChBHight,DToBelt);
                             Pseudo_Uart2_Write_Text(txt);
                            #endif
                            dC=0;UIpoint=0;DIpoint=DToBelt;
                            ///////////////////////
                         }
                    }
          break;
          case    1:
                  if(Yfs<(DToBelt-Yv_th))
                  {
                    C0++;C1=0;
                    if(C0>SwitchN) 
                    {
                       ST=0;C2=0;
                    }

                  }
                  else if(Yfs>(Error2_th*(DToBelt/10)))
                  {
                     C2++;
                     if(C2>(Error2_N*SwitchN)) uError_Algo5(&ST,&dC,&C0,&C1,2);
                  }
                  else
                  {
                     C1++;C0=0;
                     if(C0>(SwitchN+SPCC)) uError_Algo5(&ST,&dC,&C0,&C1,2);
                     if(Yf>UIpoint) {UIpoint=Yf;UXpoint=dC;}
                  }
          break;
   }//switch (ST)
}
//*****************************************************************************************************
void uError_Algo5(char *ST,int *dC,int *C0,int *C1,char ErorCode)
{
     #ifdef DEBUG_MODE
     char txt[100];
     #endif
     #ifdef DEBUG_MODE
     sprintf(txt,"uError:ST-%d;a-%d;Code-%d;\n",(int)ST,(int)a,(int)ErorCode);
     Pseudo_Uart2_Write_Text(txt);
     #endif
     *ST=2;*dC=0;*C0=0;*C1=0;
}
//*****************************************************************************************************
void Vz_Algorithm_3_4(void) // Pressure detector  Vertical
{
   
   #ifdef DEBUG_MODE
      char txt[100];
   #endif
   ///  Run Time 600uSec-4mSec

//    int SPC = ParamsIn[SPC3_4]
//    int Yv_thUp = ParamsIn[Yv_thUp3_4]
//    int Yv_thDn = ParamsIn[Yv_thDn3_4]
//    int SwitchN = ParamsIn[SwitchN3_4]
//    int MaxNBeforeSmPeak = ParamsIn[MaxNBeforeSmPeak3_4]
//    int alpha = ParamsIn[alpha3_4]
//    int FilterLength = ParamsIn[FilterLength3_4]
//    int AveResultT = ParamsIn[AveResultTIn3_4]
//    static int NoSmallPeak=ParamsOut[NoSmallPeak3_4];        //Parametr OUT
//    static int U1Ipoint=ParamsOut[U1Ipoint3_4];      //Parametr OUT
//    static int U2Ipoint=ParamsOut[U2Ipoint3_4];      //Parametr OUT
//    static int DIpoint=ParamsOut[DIpoint3_4];      //Parametr OUT
//    static int AveU1Ipoint=ParamsOut[AveU1Ipoint3_4];      //Parametr OUT
//    static int AveU2Ipoint=ParamsOut[AveU2Ipoint3_4];      //Parametr OUT
//    static int AveU2Ipoint=ParamsOut[AveU2Ipoint3_4];      //Parametr OUT
//    static int ST=ParamsOut[ST3_4];      //Parametr OUT
//    static int a=ParamsOut[a3_4];      //Parametr OUT

   int SPC=8000;               //Parametr IN
   int Yv_thUp=3000;           //Parametr IN
   int Yv_thDn=-3000;          //Parametr IN
   int SwitchN=10;             //Parametr IN
   int MaxNBeforeSmPeak=400;   //Parametr IN
   int alpha=5000;             //Parametr IN
   int FilterLength=9;         //Parametr IN
   static int AveResultT=0;    //Parametr IN/OUT
   int ResultT;                //Parametr OUT
   //uError_Algo_3_4           //Parametr OUT     //See Function
   char NoSmallPeak=0;         //Parametr OUT
   static int U1Ipoint=1;      //Parametr OUT
   static int U2Ipoint;        //Parametr OUT
   static int DIpoint;         //Parametr OUT
   static int AveU1Ipoint;     //Parametr OUT
   static int AveU2Ipoint;     //Parametr OUT
   static int AveDIpoint;      //Parametr OUT
   

   static int volatile PeakBuffer[PeakBuffer_MaxLength],PeakBufferTag;
   int MaxNBeforeStop;
   static int tC=0;
   static int dC=0;
   static int C0=0;
   static int C1=0;
   static int C2=0;
   static int U1Xpoint=1;
   static int U2Xpoint;
   static int DXpoint;
   static char ST=0;
   
   int Y,j;
   char k,a,i;

   OpticDataGetFrame_VelocityOnly();
   
   MaxNBeforeStop=SPC/10;
   
   for(k=0;k<60;k++)
   {
      Y=(Vz_Sensor_Velocity_Buffer_int[k]/140)*(Vz_Sensor_Velocity_Buffer_int[k]/140)*(Vz_Sensor_Velocity_Buffer_int[k]/140);
      if(Y<Yv_thDn)
      {
          a=0;
          C0++;
      }
      else if(Y>Yv_thUp)
      {
         a=2;
         C2++;
      }
      else
      {
         a=1;
         C1++;
      }
      dC++;
      switch (ST)
      {
              case    0:
                          if(a==0)
                          {
                             C2=2;
                             if(C0>(SwitchN+10)) {ST=2;tC=0;dC=1;C0=0;C1=0;}
                          }//if(a==0)
                          else if(a==2)
                          {
                             C0=0;
                             if(C2>(SwitchN+SPC)) uError_Algo_3_4(&ST,&a,&tC,&dC,&C0,&C1,&C2,&U1Ipoint,&U2Ipoint,&DIpoint);
                          }//else if(a==2)
                          
              break;

              case    1:
                       if(a==0)
                       {
                          C2=2;
                          if(C0>SwitchN) {ST=2;tC=0;dC=1;C0=0;C1=0;}
                       } //if(a==0)
                       else if(a==2)
                       {
                          C0=0;
                          if(C2>SwitchN) uError_Algo_3_4(&ST,&a,&tC,&dC,&C0,&C1,&C2,&U1Ipoint,&U2Ipoint,&DIpoint);
                       }//else if(a==0)
              break;
              case    2:
                      //////////////////////////PRO PEAK/////////////////////////////////////
                      if(tC<PeakBuffer_MaxLength) 
                      {
                        PeakBuffer[tC]=Vz_Sensor_Velocity_Buffer_int[k];
                        if(tC>FilterLength)
                        {
                          PeakBufferTag=0;
                          for(i=0;i<FilterLength;i++)
                          {
                                    PeakBufferTag+=abs(PeakBuffer[tC-i])/FilterLength;
                          }
                          if(PeakBufferTag>DIpoint)
                          {
                            DIpoint=PeakBufferTag;
                            DXpoint=tC-(FilterLength/2);
                          }
                        }
                      }
                      else {uError_Algo_3_4(&ST,&a,&tC,&dC,&C0,&C1,&C2,&U1Ipoint,&U2Ipoint,&DIpoint);}
                      /////////////////////////////////////////////////////////////////////////
                      tC++;
                      if(a==1)
                      {
                        C2=2;
                        if(C1>SwitchN)
                        {  
                            ST=3;tC=0;C0=0;C1=0;
                        }
                      }//if(a==1)
                      else if(a==2)
                      {
                        C1=1;
                        if(C2>SwitchN) {uError_Algo_3_4(&ST,&a,&tC,&dC,&C0,&C1,&C2,&U1Ipoint,&U2Ipoint,&DIpoint);}
                      }//else if(a==2)
              break;
              case    3:
                      tC++;
                      if((a==1)&&(tC>MaxNBeforeSmPeak))
                      {
                          #ifdef DEBUG_MODE
                            sprintf(txt,"NSP %d\n",(int)NoSmallPeak);
                            Pseudo_Uart2_Write_Text(txt);
                          #endif
                          NoSmallPeak=1;
                          ST=5;tC=0;C1=0;C2=0;
                      }
                      if(a==2) 
                      {
                         C0=0;
                         if(C2>SwitchN) {ST=4;tC=0;C0=0;C2=0;NoSmallPeak=0;}
                      }
                      else if(a==0)
                      {
                         C2=0;
                         if(C0>SwitchN) {uError_Algo_3_4(&ST,&a,&tC,&dC,&C0,&C1,&C2,&U1Ipoint,&U2Ipoint,&DIpoint);}
                      }
              break;
              case    4:
                      //////////////////////////PRO PEAK/////////////////////////////////////
                      if(tC<PeakBuffer_MaxLength)
                      {
                        PeakBuffer[tC]=Vz_Sensor_Velocity_Buffer_int[k];
                        if(tC>FilterLength)
                        {
                          PeakBufferTag=0;
                          for(i=0;i<FilterLength;i++)
                          {
                                    PeakBufferTag+=abs(PeakBuffer[tC-i])/FilterLength;
                          }
                          if(PeakBufferTag>U1Ipoint)
                          {
                            U1Ipoint=PeakBufferTag;
                            U1Xpoint=tC-(FilterLength/2);
                          }
                        }
                      }
                      else {uError_Algo_3_4(&ST,&a,&tC,&dC,&C0,&C1,&C2,&U1Ipoint,&U2Ipoint,&DIpoint);}
                      /////////////////////////////////////////////////////////////////////////
                      tC++;
                      if(a==1)
                      {
                         C0=0;
                         if(C1>SwitchN) {ST=5;tC=0;C1=0;C2=0;}
                      }
                      else if(a==0)
                      {
                         C1=0;
                         if(C0>SwitchN) uError_Algo_3_4(&ST,&a,&tC,&dC,&C0,&C1,&C2,&U1Ipoint,&U2Ipoint,&DIpoint);
                      }
              break;
              case    5:
                      if(a==2)
                      {
                        C0=0;
                        if(C2>SwitchN) {ST=6;tC=0;C1=0;C2=0;}
                      }
                      else if(a==0)
                      {
                        C2=0;
                        if(C0>SwitchN) uError_Algo_3_4(&ST,&a,&tC,&dC,&C0,&C1,&C2,&U1Ipoint,&U2Ipoint,&DIpoint);
                      }
              break;
              case    6:
                      //////////////////////////PRO PEAK/////////////////////////////////////
                      if(tC<PeakBuffer_MaxLength)
                      {
                        PeakBuffer[tC]=Vz_Sensor_Velocity_Buffer_int[k];
                        if(tC>FilterLength)
                        {
                          PeakBufferTag=0;
                          for(i=0;i<FilterLength;i++)
                          {
                                    PeakBufferTag+=abs(PeakBuffer[tC-i])/FilterLength;
                          }
                          if(PeakBufferTag>U2Ipoint)
                          {
                            U2Ipoint=PeakBufferTag;
                            U2Xpoint=tC-(FilterLength/2);
                          }
                        }
                      }
                      else {uError_Algo_3_4(&ST,&a,&tC,&dC,&C0,&C1,&C2,&U1Ipoint,&U2Ipoint,&DIpoint);}
                      /////////////////////////////////////////////////////////////////////////
                      tC++;
                      if(a==1)
                      {
                        C0=0;
                        if(C1>SwitchN) 
                        {
                          ///// END CYCLE //////////
                          ResultT=dC-tC+U2Xpoint-DXpoint;
                          AveResultT=(int)((float)(((float)((10000.0-(float)alpha)*(float)AveResultT)+(float)((float)alpha*(float)ResultT))/10000.0));
                          #ifdef DEBUG_MODE
                            sprintf(txt,"%d,%d,%d,%d,%d\n",ResultT,AveResultT,U1Ipoint,U2Ipoint,DIpoint);
                            Pseudo_Uart2_Write_Text(txt);
                          #endif
                          //////////////////////////
                          U1Ipoint=0;DIpoint=0;U2Ipoint=0;ST=1;tC=0;C1=0;C2=0;
                        }
                      }
                      else if(a==0)
                      {
                        C1=0;
                        if(C0>SwitchN) uError_Algo_3_4(&ST,&a,&tC,&dC,&C0,&C1,&C2,&U1Ipoint,&U2Ipoint,&DIpoint);
                      }
              break;
      }
   }//for(k=0;k<60;k++)
}
//*****************************************************************************************************
void uError_Algo_3_4(char *ST,char *a,int *tC,int *dC,int *C0,int *C1,int *C2,int *U1Ipoint,int *U2Ipoint,int *DIpoint)
{
     char txt[50];
     #ifdef DEBUG_MODE
     sprintf(txt,"Error: ST-%d;a-%d\n",(int)ST,(int)a);
     Pseudo_Uart2_Write_Text(txt);
     #endif
     *ST=0;*tC=0;*dC=0;*C0=0;*C1=0;*C2=0;*U1Ipoint=0;*U2Ipoint=0;*DIpoint=0;
}
//*****************************************************************************************************
void Vz_Algorithm_2(void)//Motion detector
{
   ///  Run Time 360uSec-1mSec

    //    int SPC = ParamsIn[SPC2]
//    int Yv_th = ParamsIn[Yv_th2]
//    int minStartN = ParamsIn[minStartN2]
//    int minStopN = ParamsIn[minStopN2]
//    int minResult = ParamsIn[minResult2]
//    int Result = ParamsIn[Result2]

   char txt[100];
   int SPC=4000;               //Parametr IN
   int Yv_th=2000;             //Parametr IN
   int minStartN=10;           //Parametr IN
   int minStopN=10;            //Parametr IN
   int MaxNBeforeStop;
   int minResult=200;          //Parametr IN
   static int cCounter=0;
   static int upCounter=0;
   static int dnCounter=0;
   static char ST=0;
   int Y;
   int Result;                 //Parametr OUT
   int Res;
   static unsigned int i=1;
   char k;

   OpticDataGetFrame_VelocityOnly();
   MaxNBeforeStop=SPC/4;
   for(k=0;k<60;k++)
   {
      Y=(Vz_Sensor_Velocity_Buffer_int[k]/256)*(Vz_Sensor_Velocity_Buffer_int[k]/256);
      switch (ST)
      {
              case    1:
                       cCounter++;
                       if(Y>Yv_th)
                       {
                          upCounter++;
                          if(upCounter>minStopN) dnCounter=0;
                       }
                       else //if(Y>Yv_th)
                       {
                          if(dnCounter>MaxNBeforeStop)
                          {
                             ST=0;
                             Res=cCounter-dnCounter;
                             if(Res>minResult)
                             {
                                 Result=Res; //Output In Real Time
                                 #ifdef DEBUG_MODE
                                 sprintf(txt,"%d\n",Res);
                                 Pseudo_Uart2_Write_Text(txt);
                                 #endif
                             }//if(Res>minResult)
                             cCounter=0;
                          }//if(dnCounter>MaxNBeforeStop)
                          dnCounter++;
                          upCounter=0;
                       }//if(Y>Yv_th)
              break;
              
              case    0:
                       if(Y>Yv_th)
                       {
                          if(upCounter>minStartN) ST=1;
                          upCounter++;
                          dnCounter=0;
                       }//if(Y>Yv_th)
                       else
                       {
                          dnCounter++;
                          upCounter=0;
                       }
              break;
      }
   }//for(k=0;k<60;k++)
}