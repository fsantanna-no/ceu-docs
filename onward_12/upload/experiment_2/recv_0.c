#include <inttypes.h>

#include "led.h"
#include "clock.h"
#include "com.h"

#include "show.c"

void start(void)
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
