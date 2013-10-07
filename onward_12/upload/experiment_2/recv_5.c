#include <inttypes.h>

#include "mos.h"
#include "msched.h"
#include "led.h"
#include "clock.h"
#include "com.h"

#include "show.c"

void receiver (void)
{
    uint32_t t = 0;
    int count;

    comBuf *recv_pkt;
    com_mode(IFACE_RADIO, IF_LISTEN);

    for (count=0; count<3000; count++)
    {
        recv_pkt = com_recv(IFACE_RADIO);

        // 1st message starts the experiment
        if (count == 0)
            t = mos_get_realtime();

        mos_led_toggle(0);
        com_free_buf(recv_pkt);
    }
    t = mos_get_realtime() - t;

    while (1)
    {
        mos_led_display(0);
        mos_thread_sleep(200);
        mos_led_display(7);
        mos_thread_sleep(200);
        mos_led_display(0);
        mos_thread_sleep(200);

        show(t,6,18);
    }
}

void t1 (void) { while (1); }
void t2 (void) { while (1); }
void t3 (void) { while (1); }
void t4 (void) { while (1); }
void t5 (void) { while (1); }

void start(void)
{
    mos_thread_new(receiver, 100, PRIORITY_HIGH);

    mos_thread_new(t1, 10, PRIORITY_NORMAL);
    mos_thread_new(t2, 10, PRIORITY_NORMAL);
    mos_thread_new(t3, 10, PRIORITY_NORMAL);
    mos_thread_new(t4, 10, PRIORITY_NORMAL);
    mos_thread_new(t5, 10, PRIORITY_NORMAL);
}
