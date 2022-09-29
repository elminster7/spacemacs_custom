#=========
# @export
#======================
.EXPORT_ALL_VARIABLES:

CUR_DIR := $(CURDIR)

.PHONY: all

#================
# @qemu
#===============
QEMU_TAR := qemu-7.1.0.tar.xz
QEMU_VER := qemu-7.1.0

.PHONY: qemu qemu_packages

qemu: qemu_packages
	$(AT)test -d $(CURDIR)/QEMU || mkdir -p $(CURDIR)/QEMU
	$(AT)test -f $(CURDIR)/QEMU/$(QEMU_TAR) || wget -O $(CURDIR)/QEMU/qemu-7.1.0.tar.xz https://download.qemu.org/$(QEMU_TAR)
	$(AT)cd $(CURDIR)/QEMU/;tar xf $(QEMU_TAR) 
	$(AT)cd $(CURDIR)/QEMU/$(QEMU_VER)/ && ./configure --target-list=aarch64-softmmu --prefix=/usr/local && make -j$(nproc) && sudo make install

qemu_packages:
	$(AT)sudo apt-get install -y ninja-build

#=============
# @emacs
#=============
.PHONY: emacs emacs_packages emacs_env
emacs: emacs_packages
	$(AT)test -d $(CURDIR)/emacs || git clone -b emacs-28 https://github.com/emacs-mirror/emacs
	$(AT)export CC=/usr/bin/gcc-10 CXX=/usr/bin/g++-10
	$(AT)cd $(CURDIR)/emacs && ./autogen.sh && sh ./configure --with-nativecomp --with-gnutls=yes
	$(AT)cd $(CURDIR)/emacs && make -j$(nproc) && sudo make install

#===========
# @emacs_prepare
#==========
emacs_packages:
	$(AT)sudo apt-get install -y texinfo libncurses5-dev libtinfo-dev libxpm-dev pkgconf autoconf cmake \
		libtiff-dev libgif-dev libjpeg-dev libgtk-3-dev git libgnutls30 ripgrep \
		gcc-10 g++-10 libgccjit0 libgccjit-10-dev libjansson4 libjansson-dev libgnutls28-dev

emacs_env:
	$(AT)test -d $(CURDIR)/.emacs.d || git clone https://github.com/elminster7/spacemacs_custom $(CURDIR)/.emacs.d
	$(AT)test -f $(CURDIR)/.spacemacs || cp .emacs.d/.spacemacs $(CURDIR)

all:
	$(info $(CUR_DIR))
