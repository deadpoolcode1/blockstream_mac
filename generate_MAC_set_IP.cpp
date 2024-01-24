#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <xx> <yy>\n", argv[0]);
        return EXIT_FAILURE;
    }


    // Construct the ifconfig command
    char ifconfigCommand[100];
    // Assuming the fixed prefix is 7C:E4:AA:01
    char macAddress[18];

    char IPaddr[20];

    int result;

    sprintf(ifconfigCommand, "ifconfig eth0 down");
    printf("The ifconfig cmd: %s\n", ifconfigCommand);
    result = system(ifconfigCommand);

    snprintf(macAddress, sizeof(macAddress), "7C:E4:AA:01:%02X:%02X", atoi(argv[1]), atoi(argv[2]));
    snprintf(ifconfigCommand, sizeof(ifconfigCommand), "sudo ifconfig eth0 hw ether %s", macAddress);
    printf("The ifconfig cmd: %s\n", ifconfigCommand);
    result = system(ifconfigCommand);

    snprintf(ifconfigCommand, sizeof(ifconfigCommand), "ifconfig eth0 192.168.0.%d up", 100 + atoi(argv[2]));
    printf("The ifconfig cmd: %s\n", ifconfigCommand);
    result = system(ifconfigCommand);

    // Execute the ifconfig command

    // printf("The ifconfig cmd: %s\n", ifconfigCommand);

    if (result == 0) {
        printf("MAC address set successfully.\n");
    } else {
        fprintf(stderr, "Error setting MAC address.\n");
    }

    return result;

}

