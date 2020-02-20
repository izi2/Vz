#define PeakBuffer_MaxLength            1000
#define Algo5_FilterBuffer_Length       200

#define Algo_Parametrs_Out_Buffer_Length        23

#define Algo_2_Buffer_Length                    2
#define Algo_3_4_Buffer_Length                  22
#define Algo_5_Buffer_Length                    10


void Vz_Algorithm_2(void);
void Vz_Algorithm_3_4(void);
void Vz_Algorithm_5(void);
void uError_Algo_3_4(char *ST,char *a,int *tC,int *dC,int *C0,int *C1,int *C2,int *U1Ipoint,int *U2Ipoint,int *DIpoint);
void uError_Algo5(char *ST,int *dC,int *C0,int *C1,char ErorCode);
void void Vz_Algoritem_by_algo_select();
void ResetAlgoParametrsOutBuffer(void);


enum Algo_Types_Names {Algo_2=2,Algo_3_4,Algo_5,No_Algo};