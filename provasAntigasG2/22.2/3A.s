/*
float boba (float v, float li) {
    return v + li;
}
*/

.text 
.globl boba

boba:
    pushq %rbp
    movq %rsp,%rbp
    
    MOVSS %xmm0, %xmm2
    ADDSS %xmm1, %xmm2
    MOVSS %xmm2,%xmm0

    leave
    ret
