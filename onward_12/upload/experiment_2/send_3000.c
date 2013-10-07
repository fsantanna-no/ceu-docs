#include <inttypes.h>

#include "led.h"
#include "com.h"

#include "/data/ceu/nesC/ceu.h"
#include "show.c"

static comBuf pkt;

void start(void)
{
    int i;

    com_mode(IFACE_RADIO, IF_LISTEN);
    pkt.size = 1;

    for (i=0; i<3000; i++) {
        com_send(IFACE_RADIO, &pkt);
        mos_led_toggle(0);
        mos_mdelay(5);
    }
    mos_led_display(7);
}
