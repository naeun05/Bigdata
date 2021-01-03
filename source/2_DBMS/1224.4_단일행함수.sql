-- [IV] �������Լ�
-- �Լ� = �������Լ� + �׷��Լ�
SELECT ENAME, TO_CHAR(HIREDATE, 'YY"��"MM"��"DD"��"DY"����"') FROM EMP;
SELECT ENAME, INITCAP(ENAME) FROM EMP; --������ �Լ�
SELECT SUM(SAL) FROM EMP; --�׷��Լ�
SELECT DEPTNO, SUM(SAL) FROM EMP GROUP BY DEPTNO; -- �׷��Լ�
-- EX. �����Լ�, �����Լ�, ��¥�Լ�, ����ȯ�Լ�, NVL(), ETC...
-- (1) �����Լ�
DESC DUAL; -- ����Ŭ���� �����ϴ� 1��1��¥�� DUMMY TABLE
SELECT ABS(-9) FROM DUAL; -- ���밪 
SELECT FLOOR(34.5678) FROM DUAL; -- �Ҽ������� ���� 
SELECT FLOOR(34.5678*10)/10 FROM DUAL; -- �Ҽ��� ���ڸ����� ����
SELECT TRUNC(34.5678) FROM DUAL; -- �Ҽ������� ����
SELECT TRUNC(34.5678,1) FROM DUAL; -- �Ҽ��� ���ڸ����� ���� 
SELECT TRUNC(34.5678,-1) FROM DUAL; -- ���� �ڸ����� ���� 
--EMP ���̺��� �̸�, �޿�(���� �ڸ����� ����)
SELECT ENAME, TRUNC(SAL,-1) FROM EMP;
- EMP ���̺��� �̸�, �޿�(���� �ڸ����� ����)
SELECT ENAME, TRUNC(SAL, -2) FROM EMP;
SELECT CEIL(34.5678) FROM DUAL; -- �Ҽ������� �ø� (�� �� ��)
SELECT ROUND(34.5678) FROM DUAL; -- �Ҽ������� �ݿø�
SELECT ROUND(34.5678, 1) FROM DUAL; -- �Ҽ��� ���ڸ����� �ݿø�
SELECT ROUND (34.5678,-1) FROM DUAL;-- ���� �ڸ����� �ݿø�

SELECT FLOOR(10/4) FROM DUAL;
SELECT MOD(9, 2) FROM DUAL; -- ������ ����
SELECT MOD('9', 2) FROM DUAL; -- 9/2�� ������
--Ȧ���޿� �Ի��� �������� ��� �ʵ带 ���
SELECT * FROM EMP WHERE MOD(TO_CHAR(HIREDATE, 'MM'),2)=1;

-- (2) �����Լ�
SELECT UPPER('abcabc') FROM DUAL;
SELECT LOWER ('ABCABC') FROM DUAL;
SELECT INITCAP('abcABC') FROM DUAL;
-- JOB�� MANAGER�� ������ ��� �ʵ�
SELECT * FROM EMP WHERE UPPER(JOB) = 'MANAGER';
SELECT EMPNO, INITCAP(ENAME) FROM EMP;
-- ���� ����
SELECT 'AB'||'CD'||'EF'||'GH' FROM DUAL;
SELECT CONCAT('AB','CD') FROM DUAL; --2���� ���� ����
-- xxx�� xx�� (�̸��� JOB�̴�)
SELECT ENAME|| '�� ' || JOB||'�̴�' FROM EMP;
SELECT CONCAT(CONCAT(ENAME,'�� '), CONCAT(JOB, '�̴�')) FROM EMP;
-- SUBSTR(STR, ������ġ, ���� ����) ù��° ��ġ�� 1
-- SUBSTR(STR, ������ġ, ���ڹ���Ʈ��)
SELECT SUBSTR('WELCOM TO ORACLE',3,2) FROM DUAL; --3��°���� 2
SELECT SUBSTRB('WELCOM TO ORACLE',3,2) FROM DUAL; --3��°���� 2BYTE
SELECT SUBSTR('�����ͺ��̽�',4,3) FROM DUAL; --2��°���� 2����
SELECT SUBSTRB('�����ͺ��̽�',4,3) FROM DUAL; --4��° BYTE���� 3BYTE
-- ����� �ѹ��ڰ� 1BYTE, �ѱ� �ѹ��ڰ� 3BYTE
-- 9���� �Ի��� ����� ��� �ʵ� 
SELECT * FROM EMP WHERE SUBSTR(HIREDATE, 4,2)='09';
SELECT SUBSTR('010-99-9999',-4,4) FROM DUAL;
-- 9�Ͽ� �Ի��� ����� ��� �ʵ� 
SELECT *FROM EMP WHERE SUBSTR(HIREDATE, -2,2)='09';

SELECT LENGTH('ABCD') FROM DUAL; -- ���� ���� 4
SELECT LENGTHB ('ABCD') FROM DUAL; -- ���� BYTE �� 4
SELECT LENGTH('����Ŭ') FROM DUAL; -- ���� ���� 3
SELECT LENGTHB('����Ŭ') FROM DUAL;
-- INSTR(str, ã�� ����) ; str���� ã�� ������ ��ġ (ù��° 1), ������ 0 
-- INSTR(str, ã�� ����, ������ġ) ; str���� ������ġ���� ã�Ƽ� ã�� ������ ��ġ(ù��°1), ������ 0
SELECT INSTR('ABCABC', 'B') FROM DUAL; --B�� ó�� ������ ��ġ 
SELECT INSTR('ABCABC', 'B', 3) FROM DUAL;
-- 9���� �Ի��� ���(INSTR�̿�) 81/12/09
SELECT * FROM EMP WHERE INSTR(HIREDATE, '09')=7;
-- LPAD(����, �ڸ���, '*') ���ڸ� �ڸ�����ŭ Ȯ���ϰ� ���� ���ڸ��� *
SELECT LPAD('ORACLE', 20 ,'#') FROM DUAL;
SELECT RPAD('ORACLE', 20 ,'#') FROM DUAL;
SELECT ENAME, LPAD(SAL, 6,'*') FROM EMP;
-- ���, S****(�̸��� �� �� ���ڸ� ����ϰ� �������� *) ���
SELECT EMPNO, RPAD(SUBSTR(ENAME, 1,1),LENGTH(ENAME),'*') NAME FROM EMP;
-- 7369(���), S**** (�̸�) 80/12/**(�Ի���) ���
SELECT EMPNO, RPAD(SUBSTR(ENAME,1,1),LENGTH(ENAME),'*') NAME,RPAD(SUBSTR(HIREDATE,1,6),LENGTH(HIREDATE),'*') HIRE FROM EMP;

-- �̸��� ����° �ڸ��� R�� ��� ���(INSTR, SUBSTR,LIKE)
SELECT * FROM EMP WHERE ENAME LIKE '__R%';
SELECT * FROM EMP WHERE INSTR(ENAME, 'R')=3;
SELECT * FROM EMP WHERE SUBSTR(ENAME,3,1)='R';
SELECT TRIM('     ORACLE DB        ' ) FROM DUAL;
SELECT LTRIM('     ORACLE DB        ' ) FROM DUAL;
SELECT RTRIM('     ORACLE DB        ' ) FROM DUAL;
SELECT REPLACE (ENAME, 'A', 'XX') FROM EMP;

-- (3) ��¥ ���� �����, �Լ� 
SELECT SYSDATE FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'YY-MM-DD HH24:MI:SS') FROM DUAL;
SELECT SYSDATE-1 ����, SYSDATE ����, SYSDATE+1 ���� FROM DUAL;
-- 14�� �� 
SELECT SYSDATE+14 FROM DUAL;
-- �̸�, �Ի���, �ٹ����� ��� 
SELECT ENAME, HIREDATE, FLOOR(SYSDATE-HIREDATE) FROM EMP;
SELECT ENAME, HIREDATE, TRUNC(SYSDATE-HIREDATE) FROM EMP;
-- �̸�, �Ի���, �ٹ��ּ�, �ٹ���� ���
SELECT ENAME, HIREDATE, FLOOR((SYSDATE-HIREDATE)/7) �ٹ��ּ�, FLOOR((SYSDATE-HIREDATE)/365) �ٹ���� FROM EMP;
--MONTHS_BETWEEN() Ư���� �� ���� ������ ������
-- �̸�, �Ի���, �ٹ����� 
SELECT ENAME, HIREDATE, MONTHS_BETWEEN(SYSDATE, HIREDATE) FROM EMP;
-- ADD_MONTHS(Ư����¥, ������)Ư���� ��¥�κ��� ��� ���� ����
--  �̸�, �Ի���, �����Ⱓ������(���ʱⰣ�� 6����)
SELECT ENAME, HIREDATE, ADD_MONTHS(HIREDATE,6) FROM EMP;
-- NEXT_DAY (Ư����¥, '��') Ư����¥�κ��� ó�� �����ϴ� ������
SELECT NEXT_DAY(SYSDATE, '��') FROM DUAL;
-- LAST_DAY (Ư����¥) ; Ư����¥�� ���� ����
-- �̸�, �Ի���, ���޳� (������ ����) 
SELECT ENAME, HIREDATE, LAST_DAY(HIREDATE)FROM EMP;
-- ROUND; ��¥ �ݿø�, TRUNC;��¥ ���� 
SELECT ROUND (SYSDATE-30, 'YEAR') FROM DUAL; --��� ����� 1��1��
SELECT ROUND (SYSDATE-30, 'MONTH') FROM DUAL; --��� ����� 1��
SELECT ROUND (SYSDATE, 'DAY') FROM DUAL; -- ��� ����� �Ͽ���
SELECT ROUND (SYSDATE) FROM DUAL; --��� ����� 0�� 

SELECT TRUNC (SYSDATE-30, 'YEAR') FROM DUAL; --��� ���� 1��1��
SELECT TRUNC (SYSDATE-30, 'MONTH') FROM DUAL; --��� ���� 1��
SELECT TRUNC (SYSDATE, 'DAY') FROM DUAL; -- ��� ���� �Ͽ���
SELECT TRUNC (SYSDATE) FROM DUAL; --��� ���� 0��

--EX1. �̸�, �Ի���, �Ի��ϴ��� 1��
SELECT ENAME, HIREDATE, TRUNC(HIREDATE,'MONTH') �Ի�����1�� FROM EMP;
--EX2. �̸�, �Ի���, ���޳�(25��)
SELECT ENAME, HIREDATE, ROUND(HIREDATE-9, 'MONTH')+24 FROM EMP;
--EX3. �̸�, �Ի���, SAL(����), �̶����� ���� ������
SELECT ENAME, HIREDATE, SAL , TRUNC( MONTHS_BETWEEN(SYSDATE, HIREDATE))*SAL ������ FROM EMP;
--EX4. �̸�, �Ի���, SAL, COMM, �̶����� ���� ����(SAL*12+COMM)
SELECT ENAME, HIREDATE, SAL, COMM,  MONTHS_BETWEEN((TRUNC(SYSDATE,'YEAR')),HIREDATE)/12*(SAL*12+NVL(COMM,0)) ������ FROM EMP;

-- (4) ����ȯ �Լ�
-- TO_CHAR(��¥, ����) ; ��¥���� ���Ͽ� �°� ���ڷ� ����ȯ
    -- YY (�⵵) MM(��) MON(�� �̸�) DD(��) DY(����) 
    -- HH24(0~23��) AM(����/����) HH(0~11��) MI (��) SS(��)
SELECT ENAME, TO_CHAR(HIREDATE, 'YYYY"��"MM"��"DD"��"DY"����"') FROM EMP;
SELECT TO_CHAR(SYSDATE, 'YYYY"��" MON DD"��" AM HH"�� "MI"��" SS"��"')  FROM DUAL;

-- TO_CHAR(����, ����) ; ���ڰ��� ���Ͽ� �°� ���ڷ� ����ȯ
    -- ���ϳ� 0 ; �ڸ���. �ڸ����� ���� ������ 0���� ä��
    -- ���ϳ� 9 ; �ڸ���. �ڸ����� ���� ������ ä���� ���� (�ڹٿ����� #)
    -- ���ϳ� $ ; ��ȭ ���� $�� ���� �տ� ����
    -- ���ϳ� L ; ������ȭ������ ���� �տ� ���� 
SELECT ENAME, TO_CHAR(SAL, 'L999,999') SAL FROM EMP;
SELECT ENAME, TO_CHAR(SAL, '$999,999') SAL FROM EMP;
SELECT ENAME, TO_CHAR(SAL, '$000,000') SAL FROM EMP;

-- TO_DATE(����, ����) ; '81/01/01'���ڸ� ���Ͽ� �°� ��¥������ ��ȯ
-- 81/5/1 ~ 83/5/1 ���̿� �Ի��� ���� ���
SELECT * FROM EMP
    WHERE HIREDATE BETWEEN '81/05/01' AND '83/05/01';
    
SELECT * FROM EMP
    WHERE HIREDATE BETWEEN TO_DATE('1981/05/01','YYYY/MM/DD') AND TO_DATE('1983/05/01','YYYY/MM/DD');
-- 2020�� 11�� 30�Ϻ��� ������� ��¥ ���� ��� (�ý����� ��¥�� ������ �𸥴ٴ� ����)
SELECT TRUNC(SYSDATE-TO_DATE('20201130', 'YYYYMMDD'))FROM DUAL; --28
SELECT CEIL(SYSDATE-TO_DATE('20201130', 'YYYYMMDD'))FROM DUAL; --29 
    
-- TO_NUMBER(����, ����) ; ���ڸ� ���Ͽ� �°� ���������� ��ȯ
SELECT TO_NUMBER('1,000', '9,999') FROM DUAL;  --�� �� �� ���������� �����ϴ� ���� ���� �ʱ� ����

-- (5) NULL �Լ� ; NVL(���� ���� �ִ� ������, ���̸� ����� ��)
                --�Ű����� 2���� Ÿ���� ��ġ�ؾ� �Ѵ�.
-- ��� �̸�, ���ӻ���� �̸� (���ӻ�簡 ������ CEO ���)
SELECT W.ENAME, NVL(M.ENAME, 'CEO') ��� FROM EMP W, EMP M WHERE W.MGR = M.EMPNO(+);
-- ����̸�, ���ӻ���� ���(���ӻ�簡 ������ CEO ���)
SELECT ENAME, NVL(TO_CHAR(MGR), 'CEO') MGR FROM EMP ;

-- (6) DECODE(������, ��1, ���1, ��2, ���2 , ..., ��N, ���N, �׿ܰ��)
-- �̸�, �μ���ȣ, �μ��̸� 
SELECT ENAME, D.DEPTNO, DNAME
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO ;
SELECT ENAME, DEPTNO,
    DECODE(DEPTNO, 10, 'ACCOUNTING',20, 'RESEARCH', 30, 'SALES', 40, 'OPERATIONS', 'ETC') DNAME
    FROM EMP;
SELECT ENAME, DEPTNO, 
    CASE WHEN DEPTNO=10 THEN 'ACCOUNTING'
        WHEN DEPTNO=20 THEN 'RESEARCH'
        WHEN DEPTNO=30 THEN 'SALES'
        WHEN DEPTNO=40 THEN 'OPRERATIONS'
        ELSE 'ETC'
        END AS "DNAME"
        FROM EMP;
        
SELECT ENAME, DEPTNO, 
    CASE DEPTNO WHEN 10 THEN 'ACCOUNTING'
                WHEN 20 THEN 'RESEARCH'
                WHEN 30 THEN 'SALES'
                WHEN 40 THEN 'OPRERATIONS'
         ELSE 'ETC'
        END AS "DNAME"
        FROM EMP;
-- �̸�, �޿�, �λ����޿�
    -- JOB�� ���� 'ANALYST' 10% �λ�, 'MANAGER'�̸� 20%�λ�
                    --'PRESIDENT'�̸� 30% �λ�, 'SALESMAN'�̸� 40% �λ�
                    --'CLERK'�� �λ� ���� 
SELECT ENAME, SAL, 
    CASE JOB WHEN 'ANALYST' THEN SAL*1.1
             WHEN 'MANAGER' THEN SAL*1.2
             WHEN 'PRESIDENT' THEN SAL*1.3
             WHEN 'SALESMAN' THEN SAL*1.4
             ELSE SAL
             END AS "�λ�޿�"
             FROM EMP;
-- (7) �׿� EXTRACT, ������ ���
SELECT EXTRACT(YEAR FROM HIREDATE) YEAR FROM EMP;
SELECT TO_CHAR(HIREDATE, 'YYYY') YEAR FROM EMP;
SELECT EXTRACT(MONTH FROM HIREDATE) YEAR FROM EMP;
SELECT TO_CHAR(HIREDATE, 'MM') YEAR FROM EMP;
-- LEVEL, START WITH(�ֻ��� ������ ����) , CONNECT BY PRIOR(�������� �Ʒ����� ���� ����)
SELECT LEVEL, LPAD(' ', LEVEL*2)||ENAME, MGR FROM EMP
    START WITH MGR IS NULL
    CONNECT BY PRIOR EMPNO=MGR;

-- �� ���� ����
-- 1. ���� ��¥�� ����ϰ� TITLE�� ��Current Date���� ����ϴ� SELECT ������ ����Ͻÿ�.
SELECT SYSDATE AS "Current Date" FROM DUAL;

-- 2. EMP ���̺��� ���� �޿��� 15%�� ������ �޿��� ����Ͽ�,
-- �����ȣ,�̸�,����,�޿�,������ �޿�(New Salary),������(Increase)�� ����ϴ� SELECT ����
SELECT EMPNO, ENAME, JOB, SAL, SAL*1.15 "New Salary", SAL*1.15-SAL "Increase" FROM EMP;

--3. �̸�, �Ի���, �Ի��Ϸκ��� 6���� �� ���ƿ��� ������ ���Ͽ� ����ϴ� SELECT ������ ����Ͻÿ�.
SELECT ENAME, HIREDATE, NEXT_DAY(ADD_MONTHS(HIREDATE,6),'��') FROM EMP;

--4. �̸�, �Ի���, �Ի��Ϸκ��� ��������� ������, �޿�, �Ի��Ϻ��� ��������� ���� �޿��� �Ѱ踦 ���
SELECT ENAME, HIREDATE, TRUNC(MONTHS_BETWEEN(SYSDATE,HIREDATE)) MONTH , SAL, TRUNC(SAL*MONTHS_BETWEEN(SYSDATE,HIREDATE))�ѱ޿� FROM EMP;

--5. ��� ����� �̸��� �޿�(15�ڸ��� ��� ������ �� ���� ��*���� ��ġ)�� ���
SELECT ENAME, LPAD(SAL,15,'*') FROM EMP;

--6. ��� ����� ������ �̸�,����,�Ի���,�Ի��� ������ ����ϴ� SELECT ������ ����Ͻÿ�.
SELECT ENAME, JOB, HIREDATE,TO_CHAR(HIREDATE, 'DY') FROM EMP;

--7. �̸��� ���̰� 6�� �̻��� ����� ������ �̸�,�̸��� ���ڼ�,������ ���
SELECT ENAME, LENGTH(ENAME),JOB FROM EMP WHERE LENGTH(ENAME)>=6 ;

--8. ��� ����� ������ �̸�, ����, �޿�, ���ʽ�, �޿�+���ʽ��� ���
SELECT ENAME, JOB, SAL, NVL(COMM,0) ���ʽ� , SAL+NVL(COMM,0)"�޿�+���ʽ�" FROM EMP;

-- 9.��� ���̺��� ������� 2��° ���ں��� 3���� ���ڸ� �����Ͻÿ�. 
SELECT ENAME, SUBSTR(ENAME,2,3) FROM EMP;

--10. ��� ���̺��� �Ի����� 12���� ����� ���, �����, �Ի����� �˻��Ͻÿ�. 
--  �ý��ۿ� ���� DATEFORMAT �ٸ� �� �����Ƿ� �Ʒ��� ����� �˾ƺ���
SELECT EMPNO, ENAME, HIREDATE FROM EMP WHERE HIREDATE LIKE '%/12/%';
SELECT EMPNO, ENAME, HIREDATE FROM EMP WHERE TO_CHAR(HIREDATE, 'MM')='12';

--11. ������ ���� ����� �˻��� �� �ִ� SQL ������ �ۼ��Ͻÿ�
--EMPNO		ENAME		�޿�
--7369		       SMITH		*******800
--7499		       ALLEN		******1600
--7521		       WARD		******1250
--����. 
SELECT EMPNO, ENAME, LPAD(SAL,10,'*') �޿� FROM EMP; 


-- 12. ������ ���� ����� �˻��� �� �ִ� SQL ������ �ۼ��Ͻÿ�
-- EMPNO	 ENAME 	�Ի���
-- 7369	  SMITH		1980-12-17
-- ��.
SELECT EMPNO, ENAME, TO_CHAR(HIREDATE,'YYYY-MM-DD') �Ի��� FROM EMP;

--13. ��� ���̺��� �μ� ��ȣ�� 20�� ����� ���, �̸�, ����, �޿��� ����Ͻÿ�.
    --(�޿��� �տ� $�� �����ϰ�3�ڸ����� ,�� ����Ѵ�)
SELECT EMPNO, ENAME, JOB, TO_CHAR(SAL, '$999,999') FROM EMP WHERE DEPTNO=20 ;


-- 14. ��� ���̺��� �޿��� ���� ���, �̸�, �޿�, ����� �˻��ϴ� SQL ������ �ۼ� �Ͻ� ��.
`-- �޿��� 0~1000 E / 1001~2000 D / 2001~3000 C / 3001~4000 B / 4001~5000 A

SELECT EMPNO, ENAME, SAL, 
    CASE WHEN SAL BETWEEN  0 AND 1000 THEN 'E' 
         WHEN SAL BETWEEN  1001 AND 2000 THEN 'D' 
         WHEN SAL BETWEEN  2001 AND 3000  THEN 'C' 
         WHEN SAL BETWEEN  3001 AND 4000 THEN 'B' 
         WHEN SAL BETWEEN  4001 AND 5000 THEN 'A'
    END AS ���
    FROM EMP ORDER BY ���;






























