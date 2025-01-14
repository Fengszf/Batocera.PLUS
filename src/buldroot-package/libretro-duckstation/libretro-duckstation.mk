################################################################################
#
# LIBRETRO DUCKSTATION
#
################################################################################
# Version.: Commits on Aug 1, 2021
LIBRETRO_DUCKSTATION_VERSION = d29d64e4859391eaf36a632e787265af61db0a11
LIBRETRO_DUCKSTATION_SITE = $(call github,libretro,duckstation,$(LIBRETRO_DUCKSTATION_VERSION))
LIBRETRO_DUCKSTATION_LICENSE = GPLv3
LIBRETRO_DUCKSTATION_SUPPORTS_IN_SOURCE_BUILD = NO
LIBRETRO_DUCKSTATION_DEPENDENCIES = fmt boost ffmpeg sdl2

LIBRETRO_DUCKSTATION_CONF_OPTS  = -DBUILD_LIBRETRO_CORE=ON
LIBRETRO_DUCKSTATION_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
LIBRETRO_DUCKSTATION_CONF_OPTS += -DTHREADS_PTHREAD_ARG=ON
LIBRETRO_DUCKSTATION_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
LIBRETRO_DUCKSTATION_CONF_OPTS += -DENABLE_VULKAN=ON
LIBRETRO_DUCKSTATION_CONF_OPTS += -DENABLE_DISCORD_PRESENCE=OFF
LIBRETRO_DUCKSTATION_CONF_OPTS += -DBUILD_QT_FRONTEND=OFF
LIBRETRO_DUCKSTATION_CONF_OPTS += -DBUILD_SDL_FRONTEND=OFF
LIBRETRO_DUCKSTATION_CONF_OPTS += -DUSE_EGL=OFF
LIBRETRO_DUCKSTATION_CONF_OPTS += -DUSE_WAYLAND=OFF
LIBRETRO_DUCKSTATION_CONF_OPTS += -DUSE_X11=OFF

LIBRETRO_DUCKSTATION_CONF_ENV += LDFLAGS=-lpthread


define LIBRETRO_DUCKSTATION_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/buildroot-build/swanstation_libretro.so \
		$(TARGET_DIR)/usr/lib/libretro/duckstation_libretro.so
endef

$(eval $(cmake-package))
