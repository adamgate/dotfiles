#include QMK_KEYBOARD_H

#define _QWERTY 0
#define _RAISE 1

enum custom_keycodes {
    QWERTY = SAFE_RANGE,
    SYMBOL
}

enum custom_tapdances {

}

qk_tap_dance_action_t tap_dance_actions[] = {

}

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {

    [_QWERTY] = LAYOUT_65_ansi_blocker(
QK_GRAVE_ESCAPE,  KC_1,    KC_2,    KC_3,    KC_4,    KC_5,    KC_6,    KC_7,    KC_8,    KC_9,    KC_0,    KC_MINS, KC_EQL,  KC_BSPC, KC_DEL,
        KC_TAB,  KC_Q,    KC_W,    KC_E,    KC_R,    KC_T,    KC_Y,    KC_U,    KC_I,    KC_O,    KC_P,    KC_LBRC, KC_RBRC, KC_BSLS, KC_PGUP,
        KC_CAPS, KC_A,    KC_S,    KC_D,    KC_F,    KC_G,    KC_H,    KC_J,    KC_K,    KC_L,    KC_SCLN, KC_QUOT,          KC_ENT,  KC_PGDN,
        KC_LSPO,          KC_Z,    KC_X,    KC_C,    KC_V,    KC_B,    KC_N,    KC_M,    KC_COMM, KC_DOT,  KC_SLSH, KC_RSPC, KC_UP,   TT(1),
        KC_LCTL, KC_LGUI, KC_LALT,                            KC_SPC,                    KC_RALT, KC_RCTL,          KC_LEFT, KC_DOWN, KC_RGHT
    ),

    [_RAISE] = LAYOUT_65_ansi_blocker(
        KC_GRV,  KC_F1,   KC_F2,   KC_F3,   KC_F4,   KC_F5,   KC_F6,   KC_F7,   KC_F8,   KC_F9,   KC_F10,  KC_F11,  KC_F12,  _______, QK_BOOT,
        _______, _______, KC_UP,   _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, KC_HOME,
        _______, KC_LEFT, KC_DOWN, KC_RGHT, _______, _______, _______, _______, _______, _______, _______, _______,          _______, KC_END,
        _______,          _______, _______, KC_CALC, _______, _______, _______, _______, _______, _______, _______, _______, _______, TT(2),
        _______, _______, _______,                            _______,                   _______, _______,          _______, _______, _______
    )
};
