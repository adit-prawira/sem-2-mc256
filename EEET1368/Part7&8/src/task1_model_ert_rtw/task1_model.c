/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * File: task1_model.c
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

#include "task1_model.h"
#include "task1_model_private.h"
#include "task1_model_dt.h"

/* Block signals (default storage) */
B_task1_model_T task1_model_B;

/* Block states (default storage) */
DW_task1_model_T task1_model_DW;

/* Real-time model */
RT_MODEL_task1_model_T task1_model_M_;
RT_MODEL_task1_model_T *const task1_model_M = &task1_model_M_;

/* Forward declaration for local functions */
static void task1_mode_SystemCore_release_e(const
  codertarget_arduinobase_int_e_T *obj);
static void task1_model_SystemCore_delete_e(const
  codertarget_arduinobase_int_e_T *obj);
static void matlabCodegenHandle_matlabCod_e(codertarget_arduinobase_int_e_T *obj);
static void task1_model_SystemCore_release(codertarget_arduinobase_inter_T *obj);
static void task1_model_SystemCore_delete(codertarget_arduinobase_inter_T *obj);
static void matlabCodegenHandle_matlabCodeg(codertarget_arduinobase_inter_T *obj);
static void arduino_AnalogInput_set_pinNumb(codertarget_arduinobase_int_e_T *obj,
  f_codertarget_arduinobase_int_T *iobj_0);
static void arduino_PWMOutput_set_pinNumber(codertarget_arduinobase_inter_T *obj,
  e_codertarget_arduinobase_int_T *iobj_0);
real_T uMultiWord2Double(const uint32_T u1[], int16_T n1, int16_T e1)
{
  real_T y;
  int16_T i;
  int16_T exp_0;
  y = 0.0;
  exp_0 = e1;
  for (i = 0; i < n1; i++) {
    y += ldexp(u1[i], exp_0);
    exp_0 += 32;
  }

  return y;
}

void uMultiWordMul(const uint32_T u1[], int16_T n1, const uint32_T u2[], int16_T
                   n2, uint32_T y[], int16_T n)
{
  int16_T i;
  int16_T j;
  int16_T k;
  int16_T nj;
  uint32_T u1i;
  uint32_T yk;
  uint32_T a1;
  uint32_T a0;
  uint32_T b1;
  uint32_T w10;
  uint32_T w01;
  uint32_T cb;

  /* Initialize output to zero */
  for (k = 0; k < n; k++) {
    y[k] = 0UL;
  }

  for (i = 0; i < n1; i++) {
    cb = 0UL;
    u1i = u1[i];
    a1 = u1i >> 16U;
    a0 = u1i & 65535UL;
    k = n - i;
    nj = n2 <= k ? n2 : k;
    k = i;
    for (j = 0; j < nj; j++) {
      u1i = u2[j];
      b1 = u1i >> 16U;
      u1i &= 65535UL;
      w10 = a1 * u1i;
      w01 = a0 * b1;
      yk = y[k] + cb;
      cb = (uint32_T)(yk < cb);
      u1i *= a0;
      yk += u1i;
      cb += (yk < u1i);
      u1i = w10 << 16U;
      yk += u1i;
      cb += (yk < u1i);
      u1i = w01 << 16U;
      yk += u1i;
      cb += (yk < u1i);
      y[k] = yk;
      cb += w10 >> 16U;
      cb += w01 >> 16U;
      cb += a1 * b1;
      k++;
    }

    if (k < n) {
      y[k] = cb;
    }
  }
}

real_T rt_roundd_snf(real_T u)
{
  real_T y;
  if (fabs(u) < 4.503599627370496E+15) {
    if (u >= 0.5) {
      y = floor(u + 0.5);
    } else if (u > -0.5) {
      y = u * 0.0;
    } else {
      y = ceil(u - 0.5);
    }
  } else {
    y = u;
  }

  return y;
}

static void task1_mode_SystemCore_release_e(const
  codertarget_arduinobase_int_e_T *obj)
{
  if ((obj->isInitialized == 1L) && obj->isSetupComplete) {
    MW_AnalogIn_Stop(obj->MW_ANALOGIN_HANDLE);
  }
}

static void task1_model_SystemCore_delete_e(const
  codertarget_arduinobase_int_e_T *obj)
{
  task1_mode_SystemCore_release_e(obj);
}

static void matlabCodegenHandle_matlabCod_e(codertarget_arduinobase_int_e_T *obj)
{
  if (!obj->matlabCodegenIsDeleted) {
    obj->matlabCodegenIsDeleted = true;
    task1_model_SystemCore_delete_e(obj);
  }
}

static void task1_model_SystemCore_release(codertarget_arduinobase_inter_T *obj)
{
  if ((obj->isInitialized == 1L) && obj->isSetupComplete) {
    obj->MW_PWM_HANDLE = MW_PWM_GetHandle(obj->PinPWM);
    MW_PWM_SetDutyCycle(obj->MW_PWM_HANDLE, 0);
    obj->MW_PWM_HANDLE = MW_PWM_GetHandle(obj->PinPWM);
    MW_PWM_Close(obj->MW_PWM_HANDLE);
  }
}

static void task1_model_SystemCore_delete(codertarget_arduinobase_inter_T *obj)
{
  task1_model_SystemCore_release(obj);
}

static void matlabCodegenHandle_matlabCodeg(codertarget_arduinobase_inter_T *obj)
{
  if (!obj->matlabCodegenIsDeleted) {
    obj->matlabCodegenIsDeleted = true;
    task1_model_SystemCore_delete(obj);
  }
}

static void arduino_AnalogInput_set_pinNumb(codertarget_arduinobase_int_e_T *obj,
  f_codertarget_arduinobase_int_T *iobj_0)
{
  iobj_0->AvailablePwmPinNames.f1 = '2';
  iobj_0->AvailablePwmPinNames.f2 = '3';
  iobj_0->AvailablePwmPinNames.f3 = '4';
  iobj_0->AvailablePwmPinNames.f4 = '5';
  iobj_0->AvailablePwmPinNames.f5 = '6';
  iobj_0->AvailablePwmPinNames.f6 = '7';
  iobj_0->AvailablePwmPinNames.f7 = '8';
  iobj_0->AvailablePwmPinNames.f8 = '9';
  iobj_0->AvailablePwmPinNames.f9[0] = '1';
  iobj_0->AvailablePwmPinNames.f9[1] = '0';
  iobj_0->AvailablePwmPinNames.f10[0] = '1';
  iobj_0->AvailablePwmPinNames.f10[1] = '1';
  iobj_0->AvailablePwmPinNames.f11[0] = '1';
  iobj_0->AvailablePwmPinNames.f11[1] = '2';
  iobj_0->AvailablePwmPinNames.f12[0] = '1';
  iobj_0->AvailablePwmPinNames.f12[1] = '3';
  obj->Hw = iobj_0;
  obj->PinAnalog = 0U;
}

static void arduino_PWMOutput_set_pinNumber(codertarget_arduinobase_inter_T *obj,
  e_codertarget_arduinobase_int_T *iobj_0)
{
  iobj_0->AvailablePwmPinNames.f1 = '2';
  iobj_0->AvailablePwmPinNames.f2 = '3';
  iobj_0->AvailablePwmPinNames.f3 = '4';
  iobj_0->AvailablePwmPinNames.f4 = '5';
  iobj_0->AvailablePwmPinNames.f5 = '6';
  iobj_0->AvailablePwmPinNames.f6 = '7';
  iobj_0->AvailablePwmPinNames.f7 = '8';
  iobj_0->AvailablePwmPinNames.f8 = '9';
  iobj_0->AvailablePwmPinNames.f9[0] = '1';
  iobj_0->AvailablePwmPinNames.f9[1] = '0';
  iobj_0->AvailablePwmPinNames.f10[0] = '1';
  iobj_0->AvailablePwmPinNames.f10[1] = '1';
  iobj_0->AvailablePwmPinNames.f11[0] = '1';
  iobj_0->AvailablePwmPinNames.f11[1] = '2';
  iobj_0->AvailablePwmPinNames.f12[0] = '1';
  iobj_0->AvailablePwmPinNames.f12[1] = '3';
  obj->Hw = iobj_0;
  obj->PinPWM = 7UL;
}

/* Model step function */
void task1_model_step(void)
{
  uint16_T rtb_AnalogInput_0;
  codertarget_arduinobase_int_e_T *obj;
  codertarget_arduinobase_inter_T *obj_0;
  uint128m_T tmp;
  uint64m_T tmp_0;
  uint32_T tmp_1;
  real_T u0;

  /* MATLABSystem: '<Root>/Analog Input' */
  if (task1_model_DW.obj.SampleTime != task1_model_P.AnalogInput_SampleTime) {
    task1_model_DW.obj.SampleTime = task1_model_P.AnalogInput_SampleTime;
  }

  obj = &task1_model_DW.obj;
  MW_AnalogIn_Start(task1_model_DW.obj.MW_ANALOGIN_HANDLE);
  obj->MW_ANALOGIN_HANDLE = MW_AnalogIn_GetHandle((uint32_T)
    task1_model_DW.obj.PinAnalog);
  MW_AnalogInSingle_ReadResult(task1_model_DW.obj.MW_ANALOGIN_HANDLE,
    &rtb_AnalogInput_0, 3);

  /* Gain: '<Root>/Gain1' incorporates:
   *  Gain: '<Root>/Gain'
   *  MATLABSystem: '<Root>/Analog Input'
   */
  tmp_1 = (uint32_T)task1_model_P.Gain_Gain * rtb_AnalogInput_0;
  uMultiWordMul(&task1_model_P.Gain1_Gain, 1, &tmp_1, 1, &tmp_0.chunks[0U], 2);

  /* Gain: '<Root>/Gain2' */
  uMultiWordMul(&task1_model_P.Gain2_Gain.chunks[0U], 2, &tmp_0.chunks[0U], 2,
                &tmp.chunks[0U], 4);

  /* Sum: '<Root>/Sum' incorporates:
   *  Constant: '<Root>/Constant'
   */
  task1_model_B.Sum = uMultiWord2Double(&tmp.chunks[0U], 4, 0) *
    1.9259299443872359E-34 - task1_model_P.Constant_Value;

  /* MATLABSystem: '<Root>/PWM' */
  obj_0 = &task1_model_DW.obj_g;
  obj_0->MW_PWM_HANDLE = MW_PWM_GetHandle(task1_model_DW.obj_g.PinPWM);

  /* Gain: '<Root>/Gain3' incorporates:
   *  Constant: '<Root>/Constant1'
   */
  u0 = task1_model_P.Gain3_Gain * task1_model_P.Constant1_Value;

  /* MATLABSystem: '<Root>/PWM' */
  if (!(u0 < 255.0)) {
    u0 = 255.0;
  }

  if (!(u0 > 0.0)) {
    u0 = 0.0;
  }

  MW_PWM_SetDutyCycle(task1_model_DW.obj_g.MW_PWM_HANDLE, (uint8_T)(int16_T)
                      rt_roundd_snf(u0));

  /* External mode */
  rtExtModeUploadCheckTrigger(1);

  {                                    /* Sample time: [1.0s, 0.0s] */
    rtExtModeUpload(0, (real_T)task1_model_M->Timing.taskTime0);
  }

  /* signal main to stop simulation */
  {                                    /* Sample time: [1.0s, 0.0s] */
    if ((rtmGetTFinal(task1_model_M)!=-1) &&
        !((rtmGetTFinal(task1_model_M)-task1_model_M->Timing.taskTime0) >
          task1_model_M->Timing.taskTime0 * (DBL_EPSILON))) {
      rtmSetErrorStatus(task1_model_M, "Simulation finished");
    }

    if (rtmGetStopRequested(task1_model_M)) {
      rtmSetErrorStatus(task1_model_M, "Simulation finished");
    }
  }

  /* Update absolute time for base rate */
  /* The "clockTick0" counts the number of times the code of this task has
   * been executed. The absolute time is the multiplication of "clockTick0"
   * and "Timing.stepSize0". Size of "clockTick0" ensures timer will not
   * overflow during the application lifespan selected.
   */
  task1_model_M->Timing.taskTime0 =
    (++task1_model_M->Timing.clockTick0) * task1_model_M->Timing.stepSize0;
}

/* Model initialize function */
void task1_model_initialize(void)
{
  /* Registration code */
  rtmSetTFinal(task1_model_M, -1);
  task1_model_M->Timing.stepSize0 = 1.0;

  /* External mode info */
  task1_model_M->Sizes.checksums[0] = (2776182897U);
  task1_model_M->Sizes.checksums[1] = (869119446U);
  task1_model_M->Sizes.checksums[2] = (880173827U);
  task1_model_M->Sizes.checksums[3] = (1737628041U);

  {
    static const sysRanDType rtAlwaysEnabled = SUBSYS_RAN_BC_ENABLE;
    static RTWExtModeInfo rt_ExtModeInfo;
    static const sysRanDType *systemRan[3];
    task1_model_M->extModeInfo = (&rt_ExtModeInfo);
    rteiSetSubSystemActiveVectorAddresses(&rt_ExtModeInfo, systemRan);
    systemRan[0] = &rtAlwaysEnabled;
    systemRan[1] = &rtAlwaysEnabled;
    systemRan[2] = &rtAlwaysEnabled;
    rteiSetModelMappingInfoPtr(task1_model_M->extModeInfo,
      &task1_model_M->SpecialInfo.mappingInfo);
    rteiSetChecksumsPtr(task1_model_M->extModeInfo,
                        task1_model_M->Sizes.checksums);
    rteiSetTPtr(task1_model_M->extModeInfo, rtmGetTPtr(task1_model_M));
  }

  /* data type transition information */
  {
    static DataTypeTransInfo dtInfo;
    (void) memset((char_T *) &dtInfo, 0,
                  sizeof(dtInfo));
    task1_model_M->SpecialInfo.mappingInfo = (&dtInfo);
    dtInfo.numDataTypes = 38;
    dtInfo.dataTypeSizes = &rtDataTypeSizes[0];
    dtInfo.dataTypeNames = &rtDataTypeNames[0];

    /* Block I/O transition table */
    dtInfo.BTransTable = &rtBTransTable;

    /* Parameters transition table */
    dtInfo.PTransTable = &rtPTransTable;
  }

  {
    codertarget_arduinobase_int_e_T *obj;
    MW_AnalogIn_TriggerSource_Type trigger_val;
    codertarget_arduinobase_inter_T *obj_0;

    /* Start for MATLABSystem: '<Root>/Analog Input' */
    task1_model_DW.obj.matlabCodegenIsDeleted = true;
    task1_model_DW.obj.isInitialized = 0L;
    task1_model_DW.obj.SampleTime = -1.0;
    task1_model_DW.obj.matlabCodegenIsDeleted = false;
    arduino_AnalogInput_set_pinNumb(&task1_model_DW.obj, &task1_model_DW.gobj_0);
    task1_model_DW.obj.SampleTime = task1_model_P.AnalogInput_SampleTime;
    obj = &task1_model_DW.obj;
    task1_model_DW.obj.isSetupComplete = false;
    task1_model_DW.obj.isInitialized = 1L;
    obj->MW_ANALOGIN_HANDLE = MW_AnalogInSingle_Open((uint32_T)
      task1_model_DW.obj.PinAnalog);
    trigger_val = MW_ANALOGIN_SOFTWARE_TRIGGER;
    MW_AnalogIn_SetTriggerSource(task1_model_DW.obj.MW_ANALOGIN_HANDLE,
      trigger_val, 0UL);
    task1_model_DW.obj.isSetupComplete = true;

    /* Start for MATLABSystem: '<Root>/PWM' */
    task1_model_DW.obj_g.matlabCodegenIsDeleted = true;
    task1_model_DW.obj_g.isInitialized = 0L;
    task1_model_DW.obj_g.matlabCodegenIsDeleted = false;
    arduino_PWMOutput_set_pinNumber(&task1_model_DW.obj_g,
      &task1_model_DW.gobj_0_f);
    obj_0 = &task1_model_DW.obj_g;
    task1_model_DW.obj_g.isSetupComplete = false;
    task1_model_DW.obj_g.isInitialized = 1L;
    obj_0->MW_PWM_HANDLE = MW_PWM_Open(task1_model_DW.obj_g.PinPWM, 0.0, 0.0);
    obj_0->MW_PWM_HANDLE = MW_PWM_GetHandle(task1_model_DW.obj_g.PinPWM);
    MW_PWM_Start(task1_model_DW.obj_g.MW_PWM_HANDLE);
    task1_model_DW.obj_g.isSetupComplete = true;
  }
}

/* Model terminate function */
void task1_model_terminate(void)
{
  /* Terminate for MATLABSystem: '<Root>/Analog Input' */
  matlabCodegenHandle_matlabCod_e(&task1_model_DW.obj);

  /* Terminate for MATLABSystem: '<Root>/PWM' */
  matlabCodegenHandle_matlabCodeg(&task1_model_DW.obj_g);
}

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
