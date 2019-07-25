# Please run this before building
# ./src/csstoh.sh src/powertop.css src/css.h

LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_MODULE_TAGS := debug
LOCAL_SHARED_LIBRARIES := libnl

LOCAL_MODULE := powertop

#LOCAL_CFLAGS += -Wall -O2 -g -fno-omit-frame-pointer -fstack-protector -Wshadow -Wformat -D_FORTIFY_SOURCE=2
#LOCAL_CPPFLAGS += -Wall -O2 -g -fno-omit-frame-pointer

LOCAL_CFLAGS += -DHAVE_LIBNL20 -Wno-unused-parameter -Wno-format -Wno-pointer-arith -Wno-unused-function -Wno-sign-compare -Wno-enum-conversion -Wno-sometimes-uninitialized
LOCAL_CPPFLAGS += -DPACKAGE_VERSION=\"2.7\"  -DPACKAGE=powertop -DHAVE_LIBNL20

LOCAL_C_INCLUDES += external/stlport/stlport/ external/stlport/stlport/stl external/stlport/stlport/using/h/  bionic external/libnl/include/

# ncurses
LOCAL_C_INCLUDES += external/libncurses/include/
LOCAL_SHARED_LIBRARIES += libncurses

# pciutils
LOCAL_C_INCLUDES += external/pciutils/include/
LOCAL_STATIC_LIBRARIES += libpci_static

# libtraceevent
LOCAL_C_INCLUDES += $(LOCAL_PATH)/traceevent/

# local includes
LOCAL_C_INCLUDES += $(LOCAL_PATH)/src/

LOCAL_SRC_FILES += \
	src/parameters/parameters.cpp \
	src/parameters/persistent.cpp \
	src/parameters/learn.cpp \
	src/process/powerconsumer.cpp \
	src/process/work.cpp \
	src/process/process.cpp \
	src/process/timer.cpp \
	src/process/processdevice.cpp \
	src/process/interrupt.cpp \
	src/process/do_process.cpp \
	src/cpu/intel_cpus.cpp \
	src/cpu/intel_gpu.cpp \
	src/cpu/cpu.cpp \
	src/cpu/cpu_linux.cpp \
	src/cpu/cpudevice.cpp \
	src/cpu/cpu_core.cpp \
	src/cpu/cpu_package.cpp \
	src/cpu/abstract_cpu.cpp \
	src/cpu/cpu_rapl_device.cpp \
	src/cpu/dram_rapl_device.cpp \
	src/cpu/rapl/rapl_interface.cpp \
	src/measurement/measurement.cpp \
	src/measurement/acpi.cpp \
	src/measurement/extech.cpp \
	src/measurement/sysfs.cpp \
	src/measurement/opal-sensors.cpp \
	src/display.cpp \
	src/report/report.cpp \
	src/report/report-maker.cpp \
	src/report/report-formatter-base.cpp \
	src/report/report-formatter-csv.cpp \
	src/report/report-formatter-html.cpp \
	src/report/report-data-html.cpp \
	src/main.cpp \
	src/tuning/tuning.cpp \
	src/tuning/tuningi2c.cpp \
	src/tuning/tuningusb.cpp \
	src/tuning/bluetooth.cpp \
	src/tuning/ethernet.cpp \
	src/tuning/runtime.cpp \
	src/tuning/iw.c \
	src/tuning/tunable.cpp \
	src/tuning/tuningsysfs.cpp \
	src/tuning/wifi.cpp \
	src/perf/perf_bundle.cpp \
	src/perf/perf.cpp \
	src/devices/thinkpad-fan.cpp \
	src/devices/alsa.cpp \
	src/devices/runtime_pm.cpp \
	src/devices/usb.cpp \
	src/devices/ahci.cpp \
	src/devices/rfkill.cpp \
	src/devices/thinkpad-light.cpp \
	src/devices/i915-gpu.cpp \
	src/devices/backlight.cpp \
	src/devices/network.cpp \
	src/devices/device.cpp \
	src/devices/gpu_rapl_device.cpp \
	src/devices/devfreq.cpp \
	src/devlist.cpp \
	src/wakeup/waketab.cpp \
	src/wakeup/wakeup.cpp \
	src/wakeup/wakeup_usb.cpp \
	src/wakeup/wakeup_ethernet.cpp \
	src/calibrate/calibrate.cpp \
	src/lib.cpp \
	traceevent/event-parse.c \
	traceevent/parse-filter.c \
	traceevent/parse-utils.c \
	traceevent/trace-seq.c \
	src/glob.c

include $(BUILD_EXECUTABLE)
