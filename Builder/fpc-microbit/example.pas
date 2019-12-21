Program example;

{ Example program taken from: https://wiki.lazarus.freepascal.org/micro:bit }

const
    GPIO_PIN_CNF_INPUT_Disconnect = 1;
    GPIO_PIN_CNF_DIR_Output = 1;
    microbit_led_col1 = 4;
    microbit_led_row1 = 13;
var
    i : longint;
begin
    GPIO.PIN_CNF[microbit_led_col1]:=(GPIO_PIN_CNF_INPUT_Disconnect shl 1) or GPIO_PIN_CNF_DIR_Output;
    GPIO.PIN_CNF[microbit_led_row1]:=(GPIO_PIN_CNF_INPUT_Disconnect shl 1) or GPIO_PIN_CNF_DIR_Output;
    while true do
      begin
        GPIO.OUTSET:=1 shl microbit_led_row1;
        GPIO.OUTCLR:=1 shl microbit_led_col1;
        for i:=1 to 500000 do
          asm
            nop
          end;
        GPIO.OUTCLR:=1 shl microbit_led_row1;
        for i:=1 to 500000 do
          asm
            nop
          end;
      end;
end.
