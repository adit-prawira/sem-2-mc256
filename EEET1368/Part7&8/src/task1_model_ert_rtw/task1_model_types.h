/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * File: task1_model_types.h
 *
 * Code generated for Simulink model 'task1_model'.
 *
 * Model version                  : 1.5
 * Simulink Coder version         : 9.2 (R2019b) 18-Jul-2019
 * C/C++ source code generated on : Wed Apr 28 15:36:22 2021
 *
 * Target selection: ert.tlc
 * Embedded hardware selection: Atmel->AVR
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */

#ifndef RTW_HEADER_task1_model_types_h_
#define RTW_HEADER_task1_model_types_h_
#include "rtwtypes.h"
#include "multiword_types.h"

/* Custom Type definition for MATLABSystem: '<Root>/Analog Input' */
#include "MW_SVD.h"
#ifndef typedef_c_cell_task1_model_T
#define typedef_c_cell_task1_model_T

typedef struct {
  char_T f1;
  char_T f2;
  char_T f3;
  char_T f4;
  char_T f5;
  char_T f6;
  char_T f7;
  char_T f8;
  char_T f9[2];
  char_T f10[2];
  char_T f11[2];
  char_T f12[2];
} c_cell_task1_model_T;

#endif                                 /*typedef_c_cell_task1_model_T*/

#ifndef typedef_e_codertarget_arduinobase_int_T
#define typedef_e_codertarget_arduinobase_int_T

typedef struct {
  c_cell_task1_model_T AvailablePwmPinNames;
} e_codertarget_arduinobase_int_T;

#endif                               /*typedef_e_codertarget_arduinobase_int_T*/

#ifndef typedef_codertarget_arduinobase_inter_T
#define typedef_codertarget_arduinobase_inter_T

typedef struct {
  boolean_T matlabCodegenIsDeleted;
  int32_T isInitialized;
  boolean_T isSetupComplete;
  e_codertarget_arduinobase_int_T *Hw;
  MW_Handle_Type MW_PWM_HANDLE;
  uint32_T PinPWM;
} codertarget_arduinobase_inter_T;

#endif                               /*typedef_codertarget_arduinobase_inter_T*/

#ifndef typedef_d_cell_task1_model_T
#define typedef_d_cell_task1_model_T

typedef struct {
  char_T f1;
  char_T f2;
  char_T f3;
  char_T f4;
  char_T f5;
  char_T f6;
  char_T f7;
  char_T f8;
  char_T f9[2];
  char_T f10[2];
  char_T f11[2];
  char_T f12[2];
} d_cell_task1_model_T;

#endif                                 /*typedef_d_cell_task1_model_T*/

#ifndef typedef_f_codertarget_arduinobase_int_T
#define typedef_f_codertarget_arduinobase_int_T

typedef struct {
  d_cell_task1_model_T AvailablePwmPinNames;
} f_codertarget_arduinobase_int_T;

#endif                               /*typedef_f_codertarget_arduinobase_int_T*/

#ifndef typedef_codertarget_arduinobase_int_e_T
#define typedef_codertarget_arduinobase_int_e_T

typedef struct {
  boolean_T matlabCodegenIsDeleted;
  int32_T isInitialized;
  boolean_T isSetupComplete;
  real_T SampleTime;
  f_codertarget_arduinobase_int_T *Hw;
  MW_Handle_Type MW_ANALOGIN_HANDLE;
  uint8_T PinAnalog;
} codertarget_arduinobase_int_e_T;

#endif                               /*typedef_codertarget_arduinobase_int_e_T*/

/* Parameters (default storage) */
typedef struct P_task1_model_T_ P_task1_model_T;

/* Forward declaration for rtModel */
typedef struct tag_RTM_task1_model_T RT_MODEL_task1_model_T;

#endif                                 /* RTW_HEADER_task1_model_types_h_ */

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
