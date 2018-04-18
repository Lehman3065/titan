#include <stdio.h>
#include <string.h>
#include "mcc_generated_files/mcc.h"
#include "http_l.h"
#include "mcc_generated_files/TCPIPLibrary/tcpv4.h"
#include "mcc_generated_files/TCPIPLibrary/ipv4.h"
#include "mcc_generated_files/TCPIPLibrary/tcpip_config.h"


// sockaddr_in_t remoteSocket;

void HTTP_L_Server(void)
{
    // create the socket for the TCP Server
    static tcpTCB_t port80TCB;

    // create the TX and RX Server's buffers
    static uint8_t rxdataport80[220];
    static uint8_t txdataport80[220];

    uint16_t rxLen, txLen, i;
    socketState_t socket_state;

    socket_state = TCP_SocketPoll(&port80TCB);

    switch(socket_state)
    {
        case NOT_A_SOCKET:
            // Inserting and initializing the socket
            TCP_SocketInit(&port80TCB);
            break;
        case SOCKET_CLOSED:
            //configure the local port
            TCP_Bind(&port80TCB, 80);
            // add receive buffer
            TCP_InsertRxBuffer(&port80TCB, rxdataport80, sizeof(rxdataport80));
            // start the server
            TCP_Listen(&port80TCB);
            break;
        case SOCKET_CONNECTED:
            // check if the buffer was sent, if yes we can send another buffer
            if(TCP_SendDone(&port80TCB))
            {
                // check to see  if there are any received data
                rxLen = TCP_GetRxLength(&port80TCB);
                if(rxLen > 0)
                {
                    rxLen = TCP_GetReceivedData(&port80TCB);

                    //simulate some buffer processing
                    for(i = 0; i < rxLen; i++)
                    {
                        txdataport80[i] = rxdataport80[i];
                    }

                    // reuse the RX buffer
                    TCP_InsertRxBuffer(&port80TCB, rxdataport80, sizeof(rxdataport80));
                    txLen = rxLen;
                    //send data back to the source
                    TCP_Send(&port80TCB, txdataport80, txLen);
                }
            }
            break;
        case SOCKET_CLOSING:
            TCP_SocketRemove(&port80TCB);
            break;
            
        default:
            // we should not end up here
            break;
    }
}

void HTTP_L_Initialize(){
 //   remoteSocket.addr.s_addr = MAKE_IPV4_ADDRESS(192, 168, 0, 16);
 //   remoteSocket.port = 60;
}