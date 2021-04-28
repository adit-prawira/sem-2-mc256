/*
 * task1_model_dt.h
 *
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * Code generation for model "task1_model".
 *
 * Model version              : 1.5
 * Simulink Coder version : 9.2 (R2019b) 18-Jul-2019
 * C source code generated on : Wed Apr 28 15:36:22 2021
 *
 * Target selection: ert.tlc
 * Embedded hardware selection: Atmel->AVR
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */

#include "ext_types.h"

/* data type size table */
static uint_T rtDataTypeSizes[] = {
  sizeof(real_T),
  sizeof(real32_T),
  sizeof(int8_T),
  sizeof(uint8_T),
  sizeof(int16_T),
  sizeof(uint16_T),
  sizeof(int32_T),
  sizeof(uint32_T),
  sizeof(boolean_T),
  sizeof(fcn_call_T),
  sizeof(int_T),
  sizeof(pointer_T),
  sizeof(action_T),
  2*sizeof(uint32_T),
  sizeof(uint16_T),
  sizeof(uint32_T),
  sizeof(uint32_T),
  sizeof(uint64m_T),
  sizeof(uint64m_T),
  sizeof(uint128m_T),
  sizeof(codertarget_arduinobase_int_e_T),
  sizeof(f_codertarget_arduinobase_int_T),
  sizeof(codertarget_arduinobase_inter_T),
  sizeof(e_codertarget_arduinobase_int_T),
  sizeof(int64m_T),
  sizeof(uint64m_T),
  sizeof(int96m_T),
  sizeof(uint96m_T),
  sizeof(int128m_T),
  sizeof(uint128m_T),
  sizeof(int160m_T),
  sizeof(uint160m_T),
  sizeof(int192m_T),
  sizeof(uint192m_T),
  sizeof(int224m_T),
  sizeof(uint224m_T),
  sizeof(int256m_T),
  sizeof(uint256m_T)
};

/* data type name table */
static const char_T * rtDataTypeNames[] = {
  "real_T",
  "real32_T",
  "int8_T",
  "uint8_T",
  "int16_T",
  "uint16_T",
  "int32_T",
  "uint32_T",
  "boolean_T",
  "fcn_call_T",
  "int_T",
  "pointer_T",
  "action_T",
  "timer_uint32_pair_T",
  "uint16_T",
  "uint32_T",
  "uint32_T",
  "uint64m_T",
  "uint64m_T",
  "uint128m_T",
  "codertarget_arduinobase_int_e_T",
  "f_codertarget_arduinobase_int_T",
  "codertarget_arduinobase_inter_T",
  "e_codertarget_arduinobase_int_T",
  "int64m_T",
  "uint64m_T",
  "int96m_T",
  "uint96m_T",
  "int128m_T",
  "uint128m_T",
  "int160m_T",
  "uint160m_T",
  "int192m_T",
  "uint192m_T",
  "int224m_T",
  "uint224m_T",
  "int256m_T",
  "uint256m_T"
};

/* data type transitions for block I/O structure */
static DataTypeTransition rtBTransitions[] = {
  { (char_T *)(&task1_model_B.Sum), 0, 0, 1 }
  ,

  { (char_T *)(&task1_model_DW.obj), 20, 0, 1 },

  { (char_T *)(&task1_model_DW.obj_g), 22, 0, 1 },

  { (char_T *)(&task1_model_DW.gobj_0), 21, 0, 4 },

  { (char_T *)(&task1_model_DW.gobj_0_f), 23, 0, 4 },

  { (char_T *)(&task1_model_DW.Scope_PWORK.LoggedData), 11, 0, 1 }
};

/* data type transition table for block I/O structure */
static DataTypeTransitionTable rtBTransTable = {
  6U,
  rtBTransitions
};

/* data type transitions for Parameters structure */
static DataTypeTransition rtPTransitions[] = {
  { (char_T *)(&task1_model_P.AnalogInput_SampleTime), 0, 0, 4 },

  { (char_T *)(&task1_model_P.Gain2_Gain), 18, 0, 1 },

  { (char_T *)(&task1_model_P.Gain1_Gain), 16, 0, 1 },

  { (char_T *)(&task1_model_P.Gain_Gain), 14, 0, 1 }
};

/* data type transition table for Parameters structure */
static DataTypeTransitionTable rtPTransTable = {
  4U,
  rtPTransitions
};

/* [EOF] task1_model_dt.h */
