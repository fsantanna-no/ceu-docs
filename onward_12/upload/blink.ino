#include <ChibiOS.h>

static WORKING_AREA(waThread1, 64);

static msg_t Thread1(void *arg) {
  pinMode(11, OUTPUT);
  while (TRUE) {
    digitalWrite(11, HIGH);
    chThdSleepMilliseconds(400);
    digitalWrite(11, LOW);
    chThdSleepMilliseconds(400);
  }
  return 0;
}

static WORKING_AREA(waThread2, 64);

static msg_t Thread2(void *arg) {
  pinMode(12, OUTPUT);  
  while (TRUE) {
    digitalWrite(12, HIGH);
    chThdSleepMilliseconds(1000);
    digitalWrite(12, LOW);
    chThdSleepMilliseconds(1000);
  }
  return 0;
}

void setup() {
  cli();
  halInit();
  chSysInit();
  
  chThdCreateStatic(waThread1, sizeof(waThread1),
    HIGHPRIO, Thread1, NULL);
  chThdCreateStatic(waThread2, sizeof(waThread2),
    HIGHPRIO, Thread2, NULL);
}

void loop() {
  chThdSleepMilliseconds(10000);
}
