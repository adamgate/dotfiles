#include QMK_KEYBOARD_H

#define _QWERTY 0
#define _LOWER  1
#define _GAMING 2
#define _RAISE  3

enum custom_keycodes {
  QWERTY = SAFE_RANGE,
  LOWER,
  GAMING,
  RAISE,
};

/*****************/
/***   IDEAS   ***/
/*****************/
/*
 * -have a combo that allows you to switch the base layer between base & gaming layers
 * -add another symbol layer where the arrow keys are combined with ctrl
 * -add another symbol layer where the arrow keys are combined with ctrl + shift
 * -add combos that allow me to switch to ANY layer from the base layer and back quickly
 */

/*****************/
/*** TAPDANCES ***/
/*****************/
enum custom_tapdances {
   TD_SHFT_CAPS = 0,
   [TD_1_F1]  = 1,
   [TD_2_F2]  = 2,
   [TD_3_F3]  = 3,
   [TD_4_F4]  = 4,
   [TD_5_F5]  = 5,
   [TD_6_F6]  = 6,
   [TD_7_F7]  = 7,
   [TD_8_F8]  = 8,
   [TD_9_F9]  = 9,
   [TD_0_F10] = 10,
};

qk_tap_dance_action_t tap_dance_actions[] = {
  [TD_SHFT_CAPS] = ACTION_TAP_DANCE_DOUBLE(KC_LSFT, KC_CAPS), //shift if pressed 1x, caps lock if pressed 2x
  [TD_1_F1] = ACTION_TAP_DANCE_DOUBLE(KC_1, KC_F1),
  [TD_2_F2] = ACTION_TAP_DANCE_DOUBLE(KC_2, KC_F2),
  [TD_3_F3] = ACTION_TAP_DANCE_DOUBLE(KC_3, KC_F3),
  [TD_4_F4] = ACTION_TAP_DANCE_DOUBLE(KC_4, KC_F4),
  [TD_5_F5] = ACTION_TAP_DANCE_DOUBLE(KC_5, KC_F5),
  [TD_6_F6] = ACTION_TAP_DANCE_DOUBLE(KC_6, KC_F6),
  [TD_7_F7] = ACTION_TAP_DANCE_DOUBLE(KC_7, KC_F7),
  [TD_8_F8] = ACTION_TAP_DANCE_DOUBLE(KC_8, KC_F8),
  [TD_9_F9] = ACTION_TAP_DANCE_DOUBLE(KC_9, KC_F9),
  [TD_0_F10] = ACTION_TAP_DANCE_DOUBLE(KC_0, KC_F10),
};

/*****************/
/***  COMBOS   ***/
/*****************/
// const uint16_t PROGMEM raiseToLayer2[] = {_______, _______, COMBO_END};
// const uint16_t PROGMEM raiseToLayer3[] = {_______, _______, COMBO_END};
// const uint16_t PROGMEM raiseToLayer4[] = {_______, _______, COMBO_END};

// const uint16_t PROGMEM lowerToLayer3[] = {_______, _______, COMBO_END};
// const uint16_t PROGMEM lowerToLayer2[] = {_______, _______, COMBO_END};
// const uint16_t PROGMEM lowerToLayer1[] = {_______, _______, COMBO_END};

// combo_t key_combos[COMBO_COUNT] = {
//     COMBO(raiseToLayer1, KC_ESC),
//     COMBO(raiseToLayer2, LCTL(KC_Z)),
// };

/*****************/
/***  KEYMAPS  ***/
/*****************/
const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {

   // layout for everyday use
  [_QWERTY] = LAYOUT(
     KC_ESC,  KC_1,    KC_2,    KC_3,    KC_4,    KC_5,                               KC_6,    KC_7,    KC_8,    KC_9,    KC_0,    KC_MINS,
     KC_TAB,  KC_Q,    KC_W,    KC_E,    KC_R,    KC_T,                               KC_Y,    KC_U,    KC_I,    KC_O,    KC_P,    KC_EQL,
     TD(TD_SHFT_CAPS), KC_A,    KC_S,    KC_D,    KC_F,  KC_G,                        KC_H,    KC_J,    KC_K,    KC_L,    KC_SCLN, KC_QUOT,
     KC_LCTL, KC_Z,    KC_X,    KC_C,    KC_V,    KC_B,  KC_DEL,              KC_ENT, KC_N,    KC_M,    KC_COMM, KC_DOT,  KC_SLSH, KC_BSLS,
                                        KC_LALT, KC_LGUI, KC_BSPC,          KC_SPC, TT(_LOWER), XXXXXXX
  ),

  [_LOWER] = LAYOUT(
     KC_GRAVE, KC_F1,  KC_F2,  KC_F3,  KC_F4,   KC_F5,                               KC_F6,   KC_F7,   KC_F8,   KC_F9,   KC_F10,  KC_PEQL,
     KC_F11,  KC_F12,  KC_UP,  XXXXXXX, XXXXXXX, KC_LPRN,                            KC_RPRN,  KC_7,    KC_8,    KC_9,   KC_PSLS, KC_PAST,
     KC_LSFT, KC_LEFT, KC_DOWN, KC_RGHT, XXXXXXX, KC_LCBR,                           KC_RCBR,  KC_4,    KC_5,    KC_6,   KC_PMNS, KC_PPLS,
     _______, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, KC_LBRC, _______,         _______, KC_RBRC,  KC_1,    KC_2,    KC_3,   KC_0, KC_PDOT,
                                        _______, _______, _______,          _______, TT(_GAMING), TT(_QWERTY)
  ),

  //makes gaming easier, adding a space for jumping closer to the movement keys
  [_GAMING] = LAYOUT(
     KC_ESC,  KC_1,    KC_2,    KC_3,    KC_4,    KC_5,                               KC_6,    KC_7,    KC_8,    KC_9,    KC_0,    KC_MINS,
     KC_TAB,  KC_Q,    KC_W,    KC_E,    KC_R,    KC_T,                               KC_Y,    KC_U,    KC_I,    KC_O,    KC_P,    KC_EQL,
     KC_LSFT, KC_A,    KC_S,    KC_D,    KC_F,    KC_G,                               KC_H,    KC_J,    KC_K,    KC_L,    KC_SCLN, KC_QUOT,
     _______, KC_Z,    KC_X,    KC_C,    KC_V,    KC_B,  _______,             _______,  KC_N,    KC_M,    KC_COMM, KC_DOT,  KC_SLSH, KC_BSLS,
                                        _______, KC_SPC, _______,           _______, TT(_RAISE), TT(_LOWER) 
  ),

  //used for editing rgb settings, sound, and misc commands
  [_RAISE] = LAYOUT(
     RGB_TOG, RGB_MOD, RGB_HUI, RGB_SAI, RGB_VAI, XXXXXXX,                            KC_MUTE, KC_VOLU, KC_MNXT, XXXXXXX, XXXXXXX, KC_CALC,
    XXXXXXX, RGB_RMOD, RGB_HUD, RGB_SAD, RGB_VAD, XXXXXXX,                            KC_MSTP, KC_VOLD, KC_MPRV, XXXXXXX, XXXXXXX, XXXXXXX,
     XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,                            XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,
     XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,         XXXXXXX, XXXXXXX, XXXXXXX,  XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,
                                         XXXXXXX, XXXXXXX, XXXXXXX,         XXXXXXX, XXXXXXX, TT(_GAMING)
  )
};

//switch between layers?
bool process_record_user(uint16_t keycode, keyrecord_t *record) {
  switch (keycode) {
    case QWERTY:
      if (record->event.pressed) {
        set_single_persistent_default_layer(_QWERTY);
      }
      return false;
      break;

    case LOWER:
      if (record->event.pressed) {
        layer_on(_LOWER);
        layer_off(_LOWER);
      }
      return false;
      break;

      case GAMING:
      if (record->event.pressed) {
        layer_on(_GAMING);
      } else {
        layer_off(_GAMING);
      }
      return false;
      break;

    case RAISE:
      if (record->event.pressed) {
        layer_on(_RAISE);
      } else {
        layer_off(_RAISE);
      }
      return false;
      break;
      
  }
  return true;
}

//rotary encoder function
// bool encoder_update_user(uint8_t index, bool clockwise) {
//     if (index == 0) {
//         if (clockwise) {
//             tap_code(KC_VOLU);
//         } else {
//             tap_code(KC_VOLD);
//         }
//     }
//     else if (index == 1) {
//         if (clockwise) {
//             tap_code(KC_PGDN);
//         } else {
//             tap_code(KC_PGUP);
//         }
//     }
//     return false;
// }