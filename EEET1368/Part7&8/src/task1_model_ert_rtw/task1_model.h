/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * File: task1_model.h
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

#ifndef RTW_HEADER_task1_model_h_
#define RTW_HEADER_task1_model_h_
#include <math.h>
#include <float.h>
#include <string.h>
#include <stddef.h>
#ifndef task1_model_COMMON_INCLUDES_
# define task1_model_COMMON_INCLUDES_
#include "rtwtypes.h"
#include "rtw_extmode.h"
#include "sysran_types.h"
#include "rtw_continuous.h"
#include "rtw_solver.h"
#include "dt_info.h"
#include "ext_work.h"
#include "MW_PWM.h"
#include "MW_AnalogIn.h"
#endif                                 /* task1_model_COMMON_INCLUDES_ */

#include "task1_model_types.h"

/* Shared type includes */
#include "multiword_types.h"
#include "MW_target_hardware_resources.h"

/* Macros for accessing real-time model data structure */
#ifndef rtmGetFinalTime
# define rtmGetFinalTime(rtm)          ((rtm)->Timing.tFinal)
#endif

#ifndef rtmGetRTWExtModeInfo
# define rtmGetRTWExtModeInfo(rtm)     ((rtm)->extModeInfo)
#endif

#ifndef rtmGetErrorStatus
# define rtmGetErrorStatus(rtm)        ((rtm)->errorStatus)
#endif

#ifndef rtmSetErrorStatus
# define rtmSetErrorStatus(rtm, val)   ((rtm)->errorStatus = (val))
#endif

#ifndef rtmGetStopRequested
# define rtmGetStopRequested(rtm)      ((rtm)->Timing.stopRequestedFlag)
#endif

#ifndef rtmSetStopRequested
# define rtmSetStopRequested(rtm, val) ((rtm)->Timing.stopRequestedFlag = (val))
#endif

#ifndef rtmGetStopRequestedPtr
# define rtmGetStopRequestedPtr(rtm)   (&((rtm)->Timing.stopRequestedFlag))
#endif

#ifndef rtmGetT
# define rtmGetT(rtm)                  ((rtm)->Timing.taskTime0)
#endif

#ifndef rtmGetTFinal
# define rtmGetTFinal(rtm)             ((rtm)->Timing.tFinal)
#endif

#ifndef rtmGetTPtr
# define rtmGetTPtr(rtm)               (&(rtm)->Timing.taskTime0)
#endif

/* Block signals (default storage) */
typedef struct {
  real_T Sum;                          /* '<Root>/Sum' */
} B_task1_model_T;

/* Block states (default storage) for system '<Root>' */
typedef struct {
  codertarget_arduinobase_int_e_T obj; /* '<Root>/Analog Input' */
  codertarget_arduinobase_inter_T obj_g;/* '<Root>/PWM' */
  f_codertarget_arduinobase_int_T gobj_0;/* '<Root>/Analog Input' */
  f_codertarget_arduinobase_int_T gobj_1;/* '<Root>/Analog Input' */
  f_codertarget_arduinobase_int_T gobj_2;/* '<Root>/Analog Input' */
  f_codertarget_arduinobase_int_T gobj_3;/* '<Root>/Analog Input' */
  e_codertarget_arduinobase_int_T gobj_0_f;/* '<Root>/PWM' */
  e_codertarget_arduinobase_int_T gobj_1_e;/* '<Root>/PWM' */
  e_codertarget_arduinobase_int_T gobj_2_p;/* '<Root>/PWM' */
  e_codertarget_arduinobase_int_T gobj_3_p;/* '<Root>/PWM' */
  struct {
    void *LoggedData;
  } Scope_PWORK;                       /* '<Root>/Scope' */
} DW_task1_model_T;

/* Parameters (default storage) */
struct P_task1_model_T_ {
  real_T AnalogInput_SampleTime;       /* Expression: 1
                                        * Referenced by: '<Root>/Analog Input'
                                        */
  real_T Constant_Value;               /* Expression: 273.15
                                        * Referenced by: '<Root>/Constant'
                                        */
  real_T Constant1_Value;              /* Expression: 0.5
                                        * Referenced by: '<Root>/Constant1'
                                        */
  real_T Gain3_Gain;                   /* Expression: 255
                                        * Referenced by: '<Root>/Gain3'
                                        */
  uint64m_T Gain2_Gain;                /* Computed Parameter: Gain2_Gain
                                        * Referenced by: '<Root>/Gain2'
                                        */
  uint32_T Gain1_Gain;                 /* Computed Parameter: Gain1_Gain
                                        * Referenced by: '<Root>/Gain1'
                                        */
  uint16_T Gain_Gain;                  /* Computed Parameter: Gain_Gain
                                        * Referenced by: '<Root>/Gain'
                                        */
};

/* Real-time Model Data Structure */
struct tag_RTM_task1_model_T {
  const char_T *errorStatus;
  RTWExtModeInfo *extModeInfo;

  /*
   * Sizes:
   * The following substructure contains sizes information
   * for many of the model attributes such as inputs, outputs,
   * dwork, sample times, etc.
   */
  struct {
    uint32_T checksums[4];
  } Sizes;

  /*
   * SpecialInfo:
   * The following substructure contains special information
   * related to other components that are dependent on RTW.
   */
  struct {
    const void *mappingInfo;
  } SpecialInfo;

  /*
   * Timing:
   * The following substructure contains information regarding
   * the timing information for the model.
   */
  struct {
    time_T taskTime0;
    uint32_T clockTick0;
    time_T stepSize0;
    time_T tFinal;
    boolean_T stopRequestedFlag;
  } Timing;
};

/* Block parameters (default storage) */
extern P_task1_model_T task1_model_P;

/* Block signals (default storage) */
extern B_task1_model_T task1_model_B;

/* Block states (default storage) */
extern DW_task1_model_T task1_model_DW;

/* Model entry point functions */
extern void task1_model_initialize(void);
extern void task1_model_step(void);
extern void task1_model_terminate(void);

/* Real-time Model object */
extern RT_MODEL_task1_model_T *const task1_model_M;

/*-
 * The generated code includes comments that allow you to trace directly
 * back to the appropriate location in the model.  The basic format
 * is <system>/block_name, where system is the system number (uniquely
 * assigned by Simulink) and block_name is the name of the block.
 *
 * Use the MATLAB hilite_system command to trace the generated code back
 * to the model.  For example,
 *
 * hilite_system('<S3>')    - opens system 3
 * hilite_system('<S3>/Kp') - opens and selects block Kp which resides in S3
 *
 * Here is the system hierarchy for this model
 *
 * '<Root>' : 'task1_model'
 */
#endif                                 /* RTW_HEADER_task1_model_h_ */

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
