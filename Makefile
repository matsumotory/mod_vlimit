##
##  Makefile -- Build procedure for sample mod_vlimit Apache module
##	  MATSUMOTO, Ryosuke
##

# target module source
TARGET=mod_vlimit.c

#   the used tools
APXS=apxs
APACHECTL=apachectl

#   additional user defines, includes and libraries
#DEF=-DSYSLOG_NAMES
#INC=
#LIB=
WC=-Wc,'-std=c99 -Wall -Werror-implicit-function-declaration -g'

#   the default target
all: mod_vlimit.so

#   compile the DSO file
mod_vlimit.so: $(TARGET)
	$(APXS) -c $(DEF) $(INC) $(LIB) $(WC) $(TARGET)

#   install the DSO file into the Apache installation
#   and activate it in the Apache configuration
install: all
	$(APXS) -i -a -n 'vlimit' .libs/mod_vlimit.so

#   cleanup
clean:
	-rm -rf .libs *.o *.so *.lo *.la *.slo *.loT

#   reload the module by installing and restarting Apache
reload: install restart

test:
	git submodule init && git submodule update && cd test/ab-mruby && make

#   the general Apache start/restart/stop procedures
start:
	$(APACHECTL) start
restart:
	$(APACHECTL) restart
stop:
	$(APACHECTL) stop

.PHONY: test
