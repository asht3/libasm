# Welcome to My Libasm

## Task
Implement some functions from the C standard library in assembly, sepcifically nasm 64. The following functions will have an assembly implementation in this library:

- `strlen`      -> `my_strlen`
- `strchr`      -> `my_strchr`
- `memset`      -> `my_memset`
- `memcpy`      -> `my_memcpy`
- `strcmp`      -> `my_strcmp`
- `memmove`     -> `my_memmove`

- `strncmp`     -> `my_strncmp`
- `strcasecmp`  -> `my_strcasecmp`
- `index`       -> `my_index`

- `read`        -> `my_read`
- `write`       -> `my_write`

## Description
This project is a collection of essential C standard library functions reimplemented in assembly language. This project demonstrates low-level system programming and optimization through assembly that mirrors the behavior of their C counterparts.

Written in NASM syntax for x86-64 architecture. It follows System V AMD64 ABI calling conventions and contains a comprehensive test suite validating against standard C library behavior.

There's a focus on performance and correctness through direct system calls and optimized algorithms.

This project serves as an educational resource for understanding assembly programming and system calls.

### Features

String Operations:

    my_strlen - Calculate string length

    my_strchr - Locate character in string

    my_strcmp / my_strncmp - String comparison

    my_strcasecmp - Case-insensitive string comparison

    my_index - Character position lookup

Memory Operations:

    my_memset - Fill memory with constant byte

    my_memcpy - Copy memory region

    my_memmove - Copy memory with overlap handling

System I/O:

    my_read - File/descriptor input

    my_write - File/descriptor output

### Requirements:
- NASM (Netwide Assembler)
- GCC (GNU Compiler Collection)
- Make
- x86-64 Linux environment

## Installation
You can clone the project repository from using the following command:
```
git clone <repository url>
```
AFter cloning the repo, move to the directory using `cd my_libasm`. Users can compile the program using the provided Makefile. Once the repository is cloned, navigate to the project directory and run the following command:
```
make
```
To remove the compiled executable and object files use the following:
```
make clean
```

## Usage
After building, link the object files with your project:
```
// Example usage in C
extern size_t my_strlen(const char* str);
extern int my_strcmp(const char* s1, const char* s2);
extern void* my_memset(void* ptr, int value, size_t num);
extern ssize_t my_read(int fd, void* buf, size_t count);
extern ssize_t my_write(int fd, const void* buf, size_t count);

int main() {
    char buffer[100];
    char* str = "Hello, World!";
    
    size_t len = my_strlen(str);
    my_memset(buffer, 'A', 50);
    
    // Use other functions...
    return 0;
}
```
Run this program using the following command:
```
./my_libasm
```

### The Core Team


<span><i>Made at <a href='https://qwasar.io'>Qwasar SV -- Software Engineering School</a></i></span>
<span><img alt='Qwasar SV -- Software Engineering School's Logo' src='https://storage.googleapis.com/qwasar-public/qwasar-logo_50x50.png' width='20px' /></span>
