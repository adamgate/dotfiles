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

///////////////////
// TAPDANCES
///////////////////
enum custom_tapdances {
   TD_SHFT_CAPS = 0,
};

qk_tap_dance_action_t tap_dance_actions[] = {
  [TD_SHFT_CAPS] = ACTION_TAP_DANCE_DOUBLE(KC_LSFT, KC_CAPS), //shift if pressed 1x, caps lock if pressed 3x
};

///////////////////
// RGB
///////////////////
// Light LEDs 6 to 9 and 12 to 15 red when caps lock is active. Hard to ignore!
// const rgblight_segment_t PROGMEM my_capslock_layer[] = RGBLIGHT_LAYER_SEGMENTS(
//     {6, 4, HSV_RED},       // Light 4 LEDs, starting with LED 6
//     {12, 4, HSV_RED}       // Light 4 LEDs, starting with LED 12
// );
// // Light LEDs 9 & 10 in cyan when keyboard layer 1 is active
// const rgblight_segment_t PROGMEM my_layer1_layer[] = RGBLIGHT_LAYER_SEGMENTS(
//     {9, 2, HSV_CYAN}
// );
// // Light LEDs 11 & 12 in purple when keyboard layer 2 is active
// const rgblight_segment_t PROGMEM my_layer2_layer[] = RGBLIGHT_LAYER_SEGMENTS(
//     {11, 2, HSV_PURPLE}
// );
// // Light LEDs 13 & 14 in green when keyboard layer 3 is active
// const rgblight_segment_t PROGMEM my_layer3_layer[] = RGBLIGHT_LAYER_SEGMENTS(
//     {13, 2, HSV_GREEN}
// );

// // Now define the array of layers. Later layers take precedence
// const rgblight_segment_t* const PROGMEM my_rgb_layers[] = RGBLIGHT_LAYERS_LIST(
//     my_capslock_layer,
//     my_layer1_layer,    // Overrides caps lock layer
//     my_layer2_layer,    // Overrides other layers
//     my_layer3_layer     // Overrides other layers
// );

// //enable and disable layers as keyboard state changes
// void keyboard_post_init_user(void) {
//     // Enable the LED layers
//     rgblight_layers = my_rgb_layers;
// }

// bool led_update_user(led_t led_state) {
//     rgblight_set_layer_state(0, led_state.caps_lock);
//     return true;
// }

// layer_state_t default_layer_state_set_user(layer_state_t state) {
//     rgblight_set_layer_state(1, layer_state_cmp(state, _QWERTY));
//     return state;
// }

// layer_state_t layer_state_set_user(layer_state_t state) {
//     rgblight_set_layer_state(2, layer_state_cmp(state, _LOWER));
//     rgblight_set_layer_state(3, layer_state_cmp(state, _RAISE));
//     return state;
// }

///////////////////
// KEYMAPS
///////////////////

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {

   // layout for everyday use
  [_QWERTY] = LAYOUT(
     KC_ESC,  KC_1,    KC_2,    KC_3,    KC_4,    KC_5,                               KC_6,    KC_7,    KC_8,    KC_9,    KC_0,    KC_MINS,
     KC_TAB,  KC_Q,    KC_W,    KC_E,    KC_R,    KC_T,                               KC_Y,    KC_U,    KC_I,    KC_O,    KC_P,    KC_EQL,
     TD(TD_SHFT_CAPS), KC_A,    KC_S,    KC_D,    KC_F,  KC_G,                        KC_H,    KC_J,    KC_K,    KC_L,    KC_SCLN, KC_QUOT,
     KC_LCPO, KC_Z,    KC_X,    KC_C,    KC_V,    KC_B,  KC_DEL,              KC_ENT, KC_N,    KC_M,    KC_COMM, KC_DOT,  KC_SLSH, KC_RAPC,
                                        KC_LGUI, _______, KC_BSPC,         KC_SPC, TT(_LOWER), KC_RALT
  ),

  //layer for programming symbols that didn't fit on the first layer
  //will probably add macros for different ide's here later
  [_LOWER] = LAYOUT(
     KC_GRAVE, KC_F1,  KC_F2,  KC_F3,  KC_F4,   KC_F5,                            KC_F6,   KC_F7,   KC_F8,   KC_F9,   KC_F10,  KC_PEQL,
     KC_F11,  KC_F12,  KC_UP,  _______, _______, KC_LPRN,                            KC_RPRN,  KC_7,    KC_8,    KC_9,   KC_PSLS, KC_PAST,
     KC_LSFT, KC_LEFT, KC_DOWN, KC_RGHT, _______, KC_LCBR,                           KC_RCBR,  KC_4,    KC_5,    KC_6,   KC_PMNS, KC_PPLS,
     KC_LCTL, _______, _______, _______, _______, KC_LBRC, KC_DEL,            KC_ENT, KC_RBRC,  KC_1,    KC_2,    KC_3,   KC_PDOT, KC_BSLS,
                                       _______, TO(_QWERTY), KC_BSPC,         KC_SPC, TT(_GAMING), KC_0
  ),

  //makes gaming easier, adding a space for jumping closer to the movement keys
  [_GAMING] = LAYOUT(
     KC_ESC,  KC_1,    KC_2,    KC_3,    KC_4,    KC_5,                               KC_6,    KC_7,    KC_8,    KC_9,    KC_0,    KC_MINS,
     KC_TAB,  KC_Q,    KC_W,    KC_E,    KC_R,    KC_T,                               KC_Y,    KC_U,    KC_I,    KC_O,    KC_P,    KC_EQL,
     KC_LSFT, KC_A,    KC_S,    KC_D,    KC_F,    KC_G,                               KC_H,    KC_J,    KC_K,    KC_L,    KC_SCLN, KC_QUOT,
     KC_LCTL, KC_Z,    KC_X,    KC_C,    KC_V,    KC_B,  KC_DEL,             KC_ENT,  KC_N,    KC_M,    KC_COMM, KC_DOT,  KC_SLSH, KC_BSLS,
                                        KC_RALT, KC_SPC, KC_BSPC,           KC_SPC, TT(_RAISE), TO(_LOWER)
  ),

  //used for editing rgb settings, sound, and misc commands
  [_RAISE] = LAYOUT(
     RGB_TOG, RGB_MOD, RGB_HUI, RGB_SAI, RGB_VAI, _______,                            KC_MUTE, KC_VOLU, KC_MNXT, _______, KC_BRIU, KC_CALC,
    _______, RGB_RMOD, RGB_HUD, RGB_SAD, RGB_VAD, _______,                            KC_MSTP, KC_VOLD, KC_MPRV, _______, KC_BRID, KC_MYCM,
     DM_REC1, DM_REC2, _______, _______, _______, _______,                            _______, _______, _______, _______, _______, KC_WSCH,
     DM_PLY1, DM_PLY2, _______, _______, _______, _______, _______,         _______, _______, _______,  _______, _______, _______, _______,
                                       DM_RSTP, TO(_GAMING), _______,        _______, _______, _______
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
        // update_tri_layer(_LOWER, _GAMING, _RAISE, _ADJUST); //this lets you go to the third layer if both layer buttons are held
      } else {
        layer_off(_LOWER);
        // update_tri_layer(_LOWER, _GAMING, _RAISE, _ADJUST);
      }
      return false;
      break;

      case GAMING:
      if (record->event.pressed) {
        layer_on(_GAMING);
        // update_tri_layer(_LOWER, _GAMING, _RAISE, _ADJUST);
      } else {
        layer_off(_GAMING);
        // update_tri_layer(_LOWER, _GAMING, _RAISE, _ADJUST);
      }
      return false;
      break;

    case RAISE:
      if (record->event.pressed) {
        layer_on(_RAISE);
        // update_tri_layer(_LOWER, _GAMING, _RAISE, _ADJUST);
      } else {
        layer_off(_RAISE);
        // update_tri_layer(_LOWER, _GAMING, _RAISE, _ADJUST);
      }
      return false;
      break;
      
  }
  return true;
}

//rotary encoder stuff
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