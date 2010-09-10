
#include "device.h"
#include <vector>
#include <stdio.h>
using namespace std;

#include "backlight.h"
#include "usb.h"
#include "ahci.h"
#include "alsa.h"
#include "rfkill.h"
#include "i915-gpu.h"
#include "thinkpad-fan.h"

#include "../parameters/parameters.h"

void device::start_measurement(void)
{
}

void device::end_measurement(void)
{
}

double	device::utilization(void)
{
	return 0.0;
}



vector<class device *> all_devices;


void devices_start_measurement(void)
{
	unsigned int i;
	for (i = 0; i < all_devices.size(); i++)
		all_devices[i]->start_measurement();
}

void devices_end_measurement(void)
{
	unsigned int i;
	for (i = 0; i < all_devices.size(); i++)
		all_devices[i]->end_measurement();
}

void report_devices(void)
{
	unsigned int i;

	printf("\n\nDevice statistics\n");
	for (i = 0; i < all_devices.size(); i++) {
		printf("%5.1f%% %6.2fW  %s (%s) \n", 
			all_devices[i]->utilization(),
			all_devices[i]->power_usage(&all_results, &all_parameters),
			all_devices[i]->class_name(),
			all_devices[i]->device_name()
			);
	}
}


void create_all_devices(void)
{
	create_all_backlights();
	create_all_usb_devices();
	create_all_ahcis();
	create_all_alsa();
	create_all_rfkills();
	create_i915_gpu();
	create_thinkpad_fan();
}
