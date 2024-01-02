CC = g++
TARGET = qview

GLFW_FLAGS = `pkg-config --cflags glfw3` `pkg-config --static --libs glfw3`
CFLAGS = -std=c++17 -Wall -g3 -I$(INC_DIR) -I$(IMGUI_DIR) -I$(IMGUI_DIR)/backends -L$(EXT_DIR)/lib -limgui -lGL $(GLFW_FLAGS)

EXT_DIR = ./ext
IMGUI_DIR = $(EXT_DIR)/imgui

OBJ_DIR = ./obj
SRC_DIR = ./src
INC_DIR = ./inc

_DEPS =
DEPS = $(patsubst %,$(INC_DIR)/%,$(_DEPS))

_OBJ = main.o
OBJ = $(patsubst %,$(OBJ_DIR)/%,$(_OBJ))

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cc $(DEPS)
	$(CC) -c $< -o $@ $(CFLAGS)

$(TARGET): $(OBJ)
	$(CC) -o $(TARGET) $^ $(CFLAGS)

.PHONY: clean

clean:
	rm -f $(OBJ_DIR)/*.o $(TARGET)
