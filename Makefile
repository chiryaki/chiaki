SRC := ./src
OUT := ./out

COMPILER := gcc
CFLAGS := -O3

LIBS := -lSDL2 -lSDL2_Image -lavformat -lavcodec -lavutil -lcomdlg32 -mwindows
OBJS := $(patsubst %.c, $(OUT)/%.o, main.c engine.c player.c utils.c)

FILE := Chiaki.exe

$(OUT)/%.o: $(SRC)/%.c
	$(COMPILER) $(CFLAGS) -c $< -o $@ -I $(SRC) $(LIBS)

$(OUT)/$(FILE): $(OBJS)
	$(COMPILER) $(CFLAGS) -o $@ $^ $(LIBS)

all: $(OUT)/$(FILE)

run: $(OUT)/$(FILE)
	@$(OUT)/$(FILE)

clean:
	rm -f $(OUT)/*.o $(OUT)/$(FILE)