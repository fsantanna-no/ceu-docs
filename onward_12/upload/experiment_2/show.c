// 12 bits
void show (uint32_t v, int b0, int bn) {
    int i;
    for (i=b0; i<bn; i+=3) {
        mos_led_display(v>>i);
        mos_thread_sleep(2000);
        mos_led_display(0);
        mos_thread_sleep(50);
    }
}
