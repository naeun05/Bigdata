-- [III] JOIN : ���̺��� 2�� �̻� �����Ͽ� �˻� 
SELECT * FROM EMP WHERE ENAME= 'SCOTT'; -- �μ���ȣ(DEPNO) :20
SELECT * FROM DEPT;
-- CROSS JOIN(FROM���� ���̺� 2�� �̻�) 
SELECT * FROM EMP,DEPT WHERE ENAME='SCOTT';
-- EQUI JOIN (���� �ʵ��� DEPTNO���� ��ġ�Ǵ� ���Ǹ� JOIN)
SELECT *FROM EMP, DEPT WHERE ENAME='SCOTT' AND EMP.DEPTNO=DEPT.DEPTNO;
SELECT * FROM EMP, DEPT WHERE EMP.DEPTNO=DEPT.DEPTNO;
-- ��� ����� �̸�, �μ���, �μ���ȣ
SELECT ENAME "NAME", DNAME, E.DEPTNO FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO
    ORDER BY ENAME; 
SELECT E.*, DNAME, LOC 
    FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO;
-- ���, �̸�, �μ���ȣ, �μ��̸�, �ٹ��� 
SELECT EMPNO, ENAME, E.DEPTNO, DNAME, LOC FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO;
--�޿� 2000�̻��� ������ �̸�, ����, �޿�, �μ���, �ٹ��� �ʵ� ���
SELECT ENAME, JOB, SAL, DNAME, LOC FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO AND SAL>2000;
--LOC�� CHICAGO�� ����� �̸�, ����, �μ���, �ٹ��� �ʵ� ���
SELECT ENAME, JOB DNAME, LOC FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO AND D.LOC='CHICAGO';
--�μ���ȣ�� 10 �Ǵ� 20�� ����� �̸�, ����, �ٹ��� ��� (�޿��� ����)
SELECT ENAME, JOB, LOC FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO AND E.DEPTNO IN(10,20) ORDER BY SAL;
-- �̸�, �޿�,��(COMM), ���� ((�޿�+COMM)*12), �μ���, �ٹ��� 
SELECT ENAME, SAL, COMM, (SAL+NVL(COMM,0))*12 ����, DNAME, LOC FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO;
-- �̸�, �޿�,��(COMM), ���� ((�޿�+COMM)*12), �μ���, �ٹ��� 
-- JOB�� SALESMAN �Ǵ� MANAGER�� ����� (������ ū �� ����)
SELECT ENAME, SAL, COMM, (SAL+NVL(COMM,0))*12 ����, DNAME, LOC FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO AND UPPER(JOB) IN('SALESMAN','MANAGER')
    ORDER BY ���� DESC;
-- COMM�� NULL�̰� �޿��� 1200�̻��� ����� �̸�, �޿�, �Ի���, �μ���ȣ, �μ��� (�μ����, �޿�ū�� ����)
SELECT ENAME, SAL, HIREDATE, E.DEPTNO, DNAME FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO AND COMM IS NULL AND SAL>=1200 ORDER BY DNAME, SAL DESC;
-- EQUI JOIN ���� 
--	���忡�� �ٹ��ϴ� ����� �̸��� �޿��� ����Ͻÿ�
SELECT * FROM DEPT;
SELECT ENAME, SAL FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO AND LOC='NEW YORK';
--	ACCOUNTING �μ� �Ҽ� ����� �̸��� �Ի����� ����Ͻÿ�
SELECT ENAME, HIREDATE FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO AND DNAME='ACCOUNTING';
--	������ MANAGER�� ����� �̸�, �μ����� ����Ͻÿ�
SELECT ENAME, DNAME FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO AND JOB='MANAGER';
--	Comm�� null�� �ƴ� ����� �̸�, �޿�, �μ��ڵ�, �ٹ����� ����Ͻÿ�
SELECT ENAME, SAL, E.DEPTNO, LOC FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO AND COMM IS NOT NULL;
-- �� NON-EQUI JOIN
SELECT ENAME, SAL FROM EMP WHERE ENAME='SCOTT';
SELECT* FROM SALGRADE;
SELECT ENAME, SAL, GRADE, LOSAL, HISAL FROM EMP, SALGRADE WHERE ENAME='SCOTT' AND SAL>=LOSAL AND SAL<=HISAL;
-- ��� ����� ���, �̸�, JOB, ��� ���, �޿�, �޿����(1���..2���..)
SELECT EMPNO, ENAME, JOB, MGR, SAL, GRADE || '���' FROM EMP, SALGRADE WHERE SAL BETWEEN LOSAL AND HISAL;
--NON-EQUI JOIN ��������
--	Comm�� null�� �ƴ� ����� �̸�, �޿�, ���, �μ���ȣ, �μ��̸�, �ٹ����� ����Ͻÿ�.
SELECT ENAME, SAL, GRADE, E.DEPTNO, DNAME, LOC FROM EMP E, DEPT D, SALGRADE WHERE E.DEPTNO=D.DEPTNO AND COMM IS NOT NULL AND SAL BETWEEN LOSAL AND HISAL;
--	�̸�, �޿�, �Ի���, �޿����
SELECT ENAME, SAL, HIREDATE, GRADE FROM EMP, SALGRADE WHERE SAL BETWEEN LOSAL AND HISAL;
--	�̸�, �޿�, �Ի���, �޿����, �μ���, �ٹ���
SELECT ENAME, SAL, HIREDATE, GRADE, DNAME, LOC FROM EMP E, DEPT D, SALGRADE WHERE E.DEPTNO=D.DEPTNO AND SAL BETWEEN LOSAL AND HISAL;
--	�̸�, �޿�, ���, �μ��ڵ�, �ٹ���. �� comm �� null�ƴ� ���
SELECT ENAME, SAL, GRADE, E.DEPTNO, LOC FROM EMP E, DEPT D, SALGRADE WHERE E.DEPTNO=D.DEPTNO AND SAL BETWEEN LOSAL AND HISAL AND COMM IS NOT NULL;
--	�̸�, �޿�, �޿����, ����, �μ���, �μ��� ���, �μ��� ������ ������. ����=(sal+comm)*12 comm�� null�̸� 0
SELECT ENAME, SAL, GRADE, (SAL+NVL(COMM,0))*12 ����, DNAME FROM EMP E, DEPT D, SALGRADE WHERE E.DEPTNO=D.DEPTNO AND SAL BETWEEN LOSAL AND HISAL 
    ORDER BY DNAME, ����;
--	�̸�, ����, �޿�, ���, �μ��ڵ�, �μ��� ���. �޿��� 1000~3000����. �������� : �μ���, �μ������� ������, ���������� �޿� ū��
SELECT ENAME, JOB, SAL, GRADE, E.DEPTNO, DNAME FROM EMP E, DEPT D, SALGRADE WHERE E.DEPTNO=D.DEPTNO AND SAL BETWEEN LOSAL AND HISAL AND SAL BETWEEN 1000 AND 3000
    ORDER BY DNAME, JOB, SAL DESC;
--	�̸�, �޿�, ���, �Ի���, �ٹ���. 81�⿡ �Ի��� ���. ��� ū��
SELECT ENAME, SAL, GRADE, HIREDATE, LOC FROM EMP E, DEPT D, SALGRADE WHERE E.DEPTNO=D.DEPTNO AND SAL BETWEEN LOSAL AND HISAL AND HIREDATE LIKE '81/%'
    ORDER BY GRADE DESC;
-- �� SELF JOIN 
SELECT W.EMPNO, W.ENAME, W.MGR, M.EMPNO, M.ENAME MANAGERNAME FROM EMP W, EMP M WHERE W.ENAME='SMITH' AND W.MGR=M.EMPNO  ;
SELECT WORKER.EMPNO, WORKER.ENAME, MANAGER.ENAME
    FROM EMP WORKER, EMP MANAGER WHERE WORKER.MGR=MANAGER.EMPNO;
-- SMITH�� ���� FORD�� ���
SELECT W.ENAME ||'�� ���� '||M.ENAME||'��.' 
    FROM EMP W, EMP M WHERE W.MGR = M.EMPNO;
--1. ����� �̸��� 'KING'�� ������� �̸��� JOB ���
SELECT W.ENAME, W.JOB FROM EMP W, EMP M WHERE W.MGR=M.EMPNO AND M.ENAME='KING'; 
--2. SCOTT�� ������ �μ���ȣ���� �ٹ��ϴ� ����� �̸� ���
SELECT E.ENAME FROM EMP S, EMP E WHERE S.ENAME='SCOTT' AND S.DEPTNO=E.DEPTNO AND NOT E.ENAME='SCOTT';
--3. SCOTT�� ������ �ٹ������� �ٹ��ϴ� ����� �̸� ���
INSERT INTO DEPT VALUES (50, 'IT', 'DALLAS');
INSERT INTO EMP (EMPNO, ENAME, DEPTNO) VALUES (9999, 'HONG',50);

SELECT * FROM DEPT;
SELECT * FROM EMP;
SELECT E2.ENAME FROM EMP E1, EMP E2, DEPT D1, DEPT D2 WHERE E1.ENAME='SCOTT' AND E1.DEPTNO=D1.DEPTNO AND E2.DEPTNO=D2.DEPTNO AND D1.LOC=D2.LOC AND E2.ENAME != 'SCOTT';   
ROLLBACK;

-- �� OUTER JOIN ; ���� ���ǿ� �������� ���� ����� ��Ÿ����
SELECT W.EMPNO, W.ENAME, NVL(M.ENAME,'--CEO--') FROM EMP W, EMP M WHERE W.MGR=M.EMPNO(+);
-- OUTER JOIN źź������
-- SMITH�� �Ŵ����� FORD�Դϴ� /KING�� �Ŵ����� ���Դϴ�.
SELECT W.ENAME || '�� �Ŵ����� '|| NVL(M.ENAME,'��') ||'�Դϴ�.' FROM EMP W, EMP M WHERE W.MGR=M.EMPNO(+);

-- �� <�� ��������> 
-- PART1
--1. �̸�, ���ӻ��
SELECT W.ENAME, M.ENAME ��� FROM EMP W, EMP M WHERE W.MGR=M.EMPNO;

--2. �̸�, �޿�, ����, ���ӻ��
SELECT W.ENAME, W.SAL, W.JOB, M.ENAME ��� FROM EMP W, EMP M WHERE W.MGR=M.EMPNO;

--3. �̸�, �޿�, ����, ���ӻ��. (��簡 ���� �������� ��ü ���� �� ���.
    --��簡 ���� �� '����'���� ���)
SELECT W.ENAME, W.SAL, W.JOB, NVL(M.ENAME,'����') ��� FROM EMP W, EMP M WHERE W.MGR=M.EMPNO(+);

--4. �̸�, �޿�, �μ���, ���ӻ���
SELECT W.ENAME, W.SAL, DNAME, M.ENAME ��� FROM EMP W, EMP M, DEPT D WHERE W.MGR=M.EMPNO AND W.DEPTNO=D.DEPTNO;

--5. �̸�, �޿�, �μ��ڵ�, �μ���, �ٹ���, ���ӻ���, (��簡 ���� �������� ��ü ���� �� ���)
SELECT W.ENAME, W.SAL, W.DEPTNO, DNAME, LOC, M.ENAME ��� FROM EMP W, EMP M, DEPT D WHERE W.MGR=M.EMPNO(+) AND W.DEPTNO=D.DEPTNO;

--6. �̸�, �޿�, ���, �μ���, ���ӻ���. �޿��� 2000�̻��� ���
SELECT W.ENAME, W.SAL, GRADE, DNAME, M.ENAME ��� FROM EMP W, EMP M, SALGRADE,DEPT D WHERE W.MGR=M.EMPNO AND W.SAL BETWEEN LOSAL AND HISAL
    AND W.DEPTNO=D.DEPTNO AND W.SAL>=2000;
    
--7. �̸�, �޿�, ���, �μ���, ���ӻ���, (���ӻ�簡 ���� �������� ��ü���� �μ��� �� ����) 
SELECT W.ENAME, W.SAL, GRADE, DNAME, M.ENAME ��� FROM EMP W, EMP M, SALGRADE, DEPT D WHERE W.SAL BETWEEN LOSAL AND HISAL
    AND W.DEPTNO=D.DEPTNO AND W.MGR=M.EMPNO(+) ORDER BY DNAME;

--8. �̸�, �޿�, ���, �μ���, ����, ���ӻ���. ����=(�޿�+comm)*12 �� comm�� null�̸� 0
SELECT W.ENAME, W.SAL, GRADE, DNAME,(W.SAL+NVL(W.COMM,0))*12 ����,M.ENAME ��� FROM EMP W, EMP M, SALGRADE, DEPT D 
    WHERE W.MGR=M.EMPNO AND W.SAL BETWEEN LOSAL AND HISAL AND W.DEPTNO=D.DEPTNO;

--9. 8���� �μ��� �� �μ��� ������ �޿��� ū �� ����
SELECT W.ENAME, W.SAL, GRADE, DNAME,(W.SAL+NVL(W.COMM,0))*12 ����,M.ENAME ��� FROM EMP W, EMP M, SALGRADE, DEPT D 
    WHERE W.MGR=M.EMPNO AND W.SAL BETWEEN LOSAL AND HISAL AND W.DEPTNO=D.DEPTNO
    ORDER BY DNAME, W.SAL DESC;

--  PART2
--1.EMP ���̺��� ��� ����� ���� �̸�,�μ���ȣ,�μ����� ����ϴ� SELECT ������ �ۼ��Ͽ���.
SELECT ENAME, E.DEPTNO, DNAME FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO;

--2. EMP ���̺��� NEW YORK���� �ٹ��ϰ� �ִ� ����� ���Ͽ� �̸�,����,�޿�,�μ����� ���
SELECT ENAME, JOB, SAL, DNAME FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO AND LOC='NEW YORK';

--3. EMP ���̺��� ���ʽ��� �޴� ����� ���Ͽ� �̸�,�μ���,��ġ�� ��� //*
SELECT ENAME, DNAME, LOC FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO AND COMM IS NOT NULL AND COMM !=0;

--4. EMP ���̺��� �̸� �� L�ڰ� �ִ� ����� ���Ͽ� �̸�,����,�μ���,��ġ�� ���
SELECT ENAME, JOB, DNAME, LOC FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO AND ENAME LIKE '%L%';

--5. ���, �����, �μ��ڵ�, �μ����� �˻��϶�. ������������ ������������
SELECT EMPNO, ENAME, E.DEPTNO, DNAME FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO ORDER BY ENAME;

--6. ���, �����, �޿�, �μ����� �˻��϶�. 
    --�� �޿��� 2000�̻��� ����� ���Ͽ� �޿��� �������� ������������ �����Ͻÿ�
SELECT EMPNO, ENAME, SAL, DNAME FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO AND SAL>=2000 ORDER BY SAL DESC;

--7. ���, �����, ����, �޿�, �μ����� �˻��Ͻÿ�. �� ������ MANAGER�̸� �޿��� 2500�̻���
-- ����� ���Ͽ� ����� �������� ������������ �����Ͻÿ�.
SELECT EMPNO, ENAME, JOB, SAL, DNAME FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO AND JOB='MANAGER' AND SAL>=2500 
    ORDER BY EMPNO;

--8. ���, �����, ����, �޿�, ����� �˻��Ͻÿ�. ��, �޿����� ������������ �����Ͻÿ�
SELECT EMPNO, ENAME, JOB, SAL, GRADE FROM EMP, SALGRADE WHERE SAL BETWEEN LOSAL AND HISAL ORDER BY SAL DESC;

--9. ������̺��� �����, ����� ��縦 �˻��Ͻÿ�(��簡 ���� �������� ��ü)
SELECT W.ENAME,M.ENAME ��� FROM EMP W, EMP M WHERE W.MGR=M.EMPNO(+);

--10. �����, ����, ����� ������ �˻��Ͻÿ�
SELECT W.ENAME, M.ENAME ���,K.ENAME ����ǻ�� FROM EMP W, EMP M, EMP K WHERE W.MGR=M.EMPNO AND M.MGR=K.EMPNO; 

--11. ���� ������� ���� ��簡 ���� ��� ������ �̸��� ��µǵ��� �����Ͻÿ�
SELECT W.ENAME, M.ENAME ���,K.ENAME ����ǻ�� FROM EMP W, EMP M, EMP K WHERE W.MGR=M.EMPNO(+) AND M.MGR=K.EMPNO(+);






















