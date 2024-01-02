CPP = g++
TARGET = libimgui

CFLAGS = -I$(INC_DIR) -I$(BAK_DIR) -Wall -std=c++17

LIB_DIR = ./lib
OBJ_DIR = ../obj/imgui
SRC_DIR = ./imgui
BAK_DIR = ./imgui/backends
INC_DIR = ./imgui

_OBJ = imgui.o imgui_draw.o imgui_tables.o imgui_widgets.o imgui_demo.o backends/imgui_impl_glfw.o backends/imgui_impl_opengl3.o
OBJ = $(patsubst %,$(OBJ_DIR)/%,$(_OBJ))

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp
	$(CPP) -c $< -o $@ $(CFLAGS)

$(TARGET): $(OBJ) $(BAK_OBJ)
	ar rcs $(LIB_DIR)/$(TARGET).a $(OBJ)

.PHONY: clean

clean: $(OBJ) $(LIB_DIR)/$(TARGET).a
	rm $^
