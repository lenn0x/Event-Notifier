## -*- makefile -*-

######################################################################
## Erlang

ERL_THRIFT=../thrift-erl

ERL := erl
ERLC := $(ERL)c

INCLUDE_DIRS := ../include $(wildcard ../deps/*/include) ${ERL_THRIFT}/include ../if/gen-erl ../if/fb303/if/gen-erl
EBIN_DIRS := $(wildcard ../deps/*/ebin)
ERLC_FLAGS := -W $(INCLUDE_DIRS:../%=-I ../%) $(EBIN_DIRS:%=-pa %)

ifndef no_debug_info
  ERLC_FLAGS += +debug_info
endif

ifdef debug
  ERLC_FLAGS += -Ddebug
endif

EBIN_DIR := ../ebin
DOC_DIR  := ../doc
EMULATOR := beam

ERL_SOURCES := $(wildcard *.erl) $(wildcard ${ERL_THRIFT}/src/*.erl) $(wildcard ../if/gen-erl/*.erl) $(wildcard ../if/fb303/if/gen-erl/*.erl)
ERL_HEADERS := $(wildcard *.hrl) $(wildcard ../include/*.hrl) $(wildcard ../if/gen-erl/*.hrl) $(wildcard ../if/fb303/if/gen-erl/*.hrl)
ERL_OBJECTS := $(ERL_SOURCES:%.erl=$(EBIN_DIR)/%.$(EMULATOR))
ERL_OBJECTS_LOCAL := $(ERL_SOURCES:%.erl=./%.$(EMULATOR))
APP_FILES := $(wildcard *.app)
EBIN_FILES = $(ERL_OBJECTS) $(APP_FILES:%.app=../ebin/%.app)
EBIN_FILES_NO_DOCS = $(ERL_OBJECTS) $(APP_FILES:%.app=../ebin/%.app)
MODULES = $(ERL_SOURCES:%.erl=%)

../ebin/%.app: %.app
	cp $< $@

$(EBIN_DIR)/%.$(EMULATOR): %.erl
	$(ERLC) $(ERLC_FLAGS) -o $(EBIN_DIR) $<

./%.$(EMULATOR): %.erl
	$(ERLC) $(ERLC_FLAGS) -o . $<

