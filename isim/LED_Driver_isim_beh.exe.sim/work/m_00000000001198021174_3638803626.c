/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "E:/Projects/ISE/ArchitectureLab/LED_Driver.v";
static unsigned int ng1[] = {1U, 0U};
static int ng2[] = {15, 0};
static int ng3[] = {0, 0};
static int ng4[] = {7, 0};
static int ng5[] = {8, 0};
static unsigned int ng6[] = {0U, 0U};
static int ng7[] = {14, 0};
static int ng8[] = {1, 0};



static void Initial_32_0(char *t0)
{
    char *t1;
    char *t2;

LAB0:    xsi_set_current_line(33, ng0);

LAB2:    xsi_set_current_line(34, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 1768);
    xsi_vlogvar_wait_assign_value(t2, t1, 0, 0, 1, 0LL);

LAB1:    return;
}

static void Always_36_1(char *t0)
{
    char t6[8];
    char t13[8];
    char t24[8];
    char t25[8];
    char t26[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    char *t14;
    char *t15;
    char *t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    char *t23;
    char *t27;
    char *t28;
    char *t29;
    char *t30;
    char *t31;
    char *t32;
    unsigned int t33;
    int t34;
    char *t35;
    unsigned int t36;
    int t37;
    int t38;
    char *t39;
    unsigned int t40;
    int t41;
    int t42;
    unsigned int t43;
    int t44;
    unsigned int t45;
    unsigned int t46;
    int t47;
    int t48;

LAB0:    t1 = (t0 + 3256U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(36, ng0);
    t2 = (t0 + 3576);
    *((int *)t2) = 1;
    t3 = (t0 + 3288);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(38, ng0);

LAB5:    xsi_set_current_line(41, ng0);
    t4 = ((char*)((ng1)));
    t5 = (t0 + 1768);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 1, 0LL);
    xsi_set_current_line(42, ng0);
    t2 = (t0 + 1928);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng2)));
    memset(t6, 0, 8);
    xsi_vlog_signed_equal(t6, 32, t4, 32, t5, 32);
    t7 = (t6 + 4);
    t8 = *((unsigned int *)t7);
    t9 = (~(t8));
    t10 = *((unsigned int *)t6);
    t11 = (t10 & t9);
    t12 = (t11 != 0);
    if (t12 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(51, ng0);

LAB14:    xsi_set_current_line(53, ng0);
    t2 = (t0 + 2088);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    memset(t6, 0, 8);
    t5 = (t6 + 4);
    t7 = (t4 + 4);
    t8 = *((unsigned int *)t4);
    t9 = (t8 >> 15);
    t10 = (t9 & 1);
    *((unsigned int *)t6) = t10;
    t11 = *((unsigned int *)t7);
    t12 = (t11 >> 15);
    t17 = (t12 & 1);
    *((unsigned int *)t5) = t17;
    t14 = (t0 + 1608);
    xsi_vlogvar_wait_assign_value(t14, t6, 0, 0, 1, 0LL);
    xsi_set_current_line(54, ng0);
    t2 = (t0 + 2088);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    memset(t6, 0, 8);
    t5 = (t6 + 4);
    t7 = (t4 + 4);
    t8 = *((unsigned int *)t4);
    t9 = (t8 >> 0);
    *((unsigned int *)t6) = t9;
    t10 = *((unsigned int *)t7);
    t11 = (t10 >> 0);
    *((unsigned int *)t5) = t11;
    t12 = *((unsigned int *)t6);
    *((unsigned int *)t6) = (t12 & 32767U);
    t17 = *((unsigned int *)t5);
    *((unsigned int *)t5) = (t17 & 32767U);
    t14 = (t0 + 2088);
    t15 = (t0 + 2088);
    t16 = (t15 + 72U);
    t23 = *((char **)t16);
    t27 = ((char*)((ng3)));
    t28 = ((char*)((ng7)));
    xsi_vlog_convert_partindices(t13, t24, t25, ((int*)(t23)), 2, t27, 32, 1, t28, 32, 1);
    t29 = (t13 + 4);
    t18 = *((unsigned int *)t29);
    t34 = (!(t18));
    t30 = (t24 + 4);
    t19 = *((unsigned int *)t30);
    t37 = (!(t19));
    t38 = (t34 && t37);
    t31 = (t25 + 4);
    t20 = *((unsigned int *)t31);
    t41 = (!(t20));
    t42 = (t38 && t41);
    if (t42 == 1)
        goto LAB15;

LAB16:    xsi_set_current_line(55, ng0);
    t2 = (t0 + 1928);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng8)));
    memset(t6, 0, 8);
    xsi_vlog_signed_add(t6, 32, t4, 32, t5, 32);
    t7 = (t0 + 1928);
    xsi_vlogvar_wait_assign_value(t7, t6, 0, 0, 32, 0LL);

LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(43, ng0);

LAB9:    xsi_set_current_line(44, ng0);
    t14 = (t0 + 1208U);
    t15 = *((char **)t14);
    memset(t13, 0, 8);
    t14 = (t13 + 4);
    t16 = (t15 + 4);
    t17 = *((unsigned int *)t15);
    t18 = (t17 >> 0);
    *((unsigned int *)t13) = t18;
    t19 = *((unsigned int *)t16);
    t20 = (t19 >> 0);
    *((unsigned int *)t14) = t20;
    t21 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t21 & 255U);
    t22 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t22 & 255U);
    t23 = (t0 + 2088);
    t27 = (t0 + 2088);
    t28 = (t27 + 72U);
    t29 = *((char **)t28);
    t30 = ((char*)((ng3)));
    t31 = ((char*)((ng4)));
    xsi_vlog_convert_partindices(t24, t25, t26, ((int*)(t29)), 2, t30, 32, 1, t31, 32, 1);
    t32 = (t24 + 4);
    t33 = *((unsigned int *)t32);
    t34 = (!(t33));
    t35 = (t25 + 4);
    t36 = *((unsigned int *)t35);
    t37 = (!(t36));
    t38 = (t34 && t37);
    t39 = (t26 + 4);
    t40 = *((unsigned int *)t39);
    t41 = (!(t40));
    t42 = (t38 && t41);
    if (t42 == 1)
        goto LAB10;

LAB11:    xsi_set_current_line(45, ng0);
    t2 = (t0 + 1208U);
    t3 = *((char **)t2);
    memset(t6, 0, 8);
    t2 = (t6 + 4);
    t4 = (t3 + 4);
    t8 = *((unsigned int *)t3);
    t9 = (t8 >> 8);
    *((unsigned int *)t6) = t9;
    t10 = *((unsigned int *)t4);
    t11 = (t10 >> 8);
    *((unsigned int *)t2) = t11;
    t12 = *((unsigned int *)t6);
    *((unsigned int *)t6) = (t12 & 255U);
    t17 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t17 & 255U);
    t5 = (t0 + 2088);
    t7 = (t0 + 2088);
    t14 = (t7 + 72U);
    t15 = *((char **)t14);
    t16 = ((char*)((ng5)));
    t23 = ((char*)((ng2)));
    xsi_vlog_convert_partindices(t13, t24, t25, ((int*)(t15)), 2, t16, 32, 1, t23, 32, 1);
    t27 = (t13 + 4);
    t18 = *((unsigned int *)t27);
    t34 = (!(t18));
    t28 = (t24 + 4);
    t19 = *((unsigned int *)t28);
    t37 = (!(t19));
    t38 = (t34 && t37);
    t29 = (t25 + 4);
    t20 = *((unsigned int *)t29);
    t41 = (!(t20));
    t42 = (t38 && t41);
    if (t42 == 1)
        goto LAB12;

LAB13:    xsi_set_current_line(46, ng0);
    t2 = ((char*)((ng6)));
    t3 = (t0 + 1768);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(47, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1928);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 32, 0LL);
    xsi_set_current_line(48, ng0);
    t2 = (t0 + 2088);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    memset(t6, 0, 8);
    t5 = (t6 + 4);
    t7 = (t4 + 4);
    t8 = *((unsigned int *)t4);
    t9 = (t8 >> 15);
    t10 = (t9 & 1);
    *((unsigned int *)t6) = t10;
    t11 = *((unsigned int *)t7);
    t12 = (t11 >> 15);
    t17 = (t12 & 1);
    *((unsigned int *)t5) = t17;
    t14 = (t0 + 1608);
    xsi_vlogvar_wait_assign_value(t14, t6, 0, 0, 1, 0LL);
    goto LAB8;

LAB10:    t43 = *((unsigned int *)t26);
    t44 = (t43 + 0);
    t45 = *((unsigned int *)t24);
    t46 = *((unsigned int *)t25);
    t47 = (t45 - t46);
    t48 = (t47 + 1);
    xsi_vlogvar_wait_assign_value(t23, t13, t44, *((unsigned int *)t25), t48, 0LL);
    goto LAB11;

LAB12:    t21 = *((unsigned int *)t25);
    t44 = (t21 + 0);
    t22 = *((unsigned int *)t13);
    t33 = *((unsigned int *)t24);
    t47 = (t22 - t33);
    t48 = (t47 + 1);
    xsi_vlogvar_wait_assign_value(t5, t6, t44, *((unsigned int *)t24), t48, 0LL);
    goto LAB13;

LAB15:    t21 = *((unsigned int *)t25);
    t44 = (t21 + 0);
    t22 = *((unsigned int *)t13);
    t33 = *((unsigned int *)t24);
    t47 = (t22 - t33);
    t48 = (t47 + 1);
    xsi_vlogvar_wait_assign_value(t14, t6, t44, *((unsigned int *)t24), t48, 0LL);
    goto LAB16;

}


extern void work_m_00000000001198021174_3638803626_init()
{
	static char *pe[] = {(void *)Initial_32_0,(void *)Always_36_1};
	xsi_register_didat("work_m_00000000001198021174_3638803626", "isim/LED_Driver_isim_beh.exe.sim/work/m_00000000001198021174_3638803626.didat");
	xsi_register_executes(pe);
}
