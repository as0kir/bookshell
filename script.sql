USE test;

DROP TABLE IF EXISTS book;

CREATE TABLE book(
	id INT(11) NOT NULL AUTO_INCREMENT,
    title VARCHAR(100),
    description VARCHAR(255),
    author VARCHAR(100),
    isbn VARCHAR(20),
    printYear INT,
    readAlready TINYINT,
    PRIMARY KEY (id)
)
ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

INSERT INTO book (title, author, isbn, printYear, readAlready, description)
VALUES
('������ ���: ��������, ������ � �����������', '������ ������', '978-5-4461-0069-9', 2013, 0, '���� ������ ����������� ��� ����� ��������. ������ ���� ��� �� �������� "������", ��� ������ ����� ������ �������� ������� � ��������-������������, ������� ������������ ������� �� ��� ��������� � "���������".'),
('������ ��������-���������������� ��������������. �������� ��������������', '�����, ����, �������', '978-5-4590-1720-5', 2013, 0, '� ������������ ����� ����������� ������� � ������� ������� �������� �����, ����������� � ��������-��������������� ��������������.'),
('������� � ������� ������', '����� ����', '978-5-00108-137-1', 2018, 0, '������� �� 11 ����������� ���������, ������� �������������� � 1894 ����. �������� ����� � ������� ������ � ������� ������� � ����� "���� ������ ����� �����".'),
('������� � ���� ������� ������. ����� 2. ��������������� ����', '������� ���', '978-5-00108-222-4', 2018, 0, '�������� ������������� � ������������� ����� ������������ � ������ �����. �������� ���� �������, ����� ������ ����������� ����������� �����.'),
('��������� ������. ����� ��������� ����', '�����������, �����', '978-5-699-71636-4', 2015, 0, '��������� ������ - "����� ����������", ���������� �� ���� "�������", ������������ �� ����������� ��� ����� ������� ����.'),
('���������� �������. ������� �������. ������� ������ ������������', '����, ������', '978-5-9603-0410-8', 2017, 0, '��������� ������ ������� ������� ������� ������� ��������������� �� ������ ������� ����������� "���������� �������" 1928 ���� � "�������� �������" 1933 ����'),
('Java Persistence API � Hibernate', '�����, ����, �������', '978-5-97060-180-8', 2017, 0, 'Java Persistence - ��������, ���������� ���������� ����������� ������ ����� ���������� ���������, ��� �������� ������� ������ ����������� ����������.'),
('��������� ���� ������', '������� ���������', '978-5-00108-159-3', 2018, 0, '������� ��� ��������� - ���������� ������� ���������� ����������: ��������, ���� � ������. �� �������� �� ������ ����� ������ ������������ ���������� �� ���� ������'),
('����� ����� � �������. ������� ����������� �����������. �� ����� III �� ������ ��������', '����� ������', '978-5-17-082532-5', 2016, 0, '� ���� ����� ������� �������� ������������� ������� XV-XVI �����, - ��� �����������, �������� �������, ��� � ��������� �������, � ������� ������� �� ��� ������� ����� ���� ��� ������������'),
('����� ���� ������', '������� ���������', '978-5-00108-194-4', 2018, 0, '������ ����� � ����� "����� �������� ����������" - ����������� ����� �� ���� ������. ������� �� ������ ������������ �������, ������������ ����� ������ - ����������� ��������� �����������, �������� � ��������������.'),

('������������� ������. ������ � �������', '���� ���������', '978-5-91045-886-8', 2016, 0, '��� ������ ��������� ������, ����������� �������� � ������������ ����� � ������� ����� ����� ����������, ����������� �������� � ��������� �� ������� ������.'),
('������������� ������ �� ������ ����', '���� ���������', '978-5-91045-896-7', 2016, 0, '���� �� ������� ������������� ��������, ����� �������� �������������� �� ����, �� �������� ����� ������������� ������.'),
('������� � ���� ������� ������. ����� 1', '������� ���', '978-5-00108-110-4', 2017, 0, '������� ������, ������� �������� �� ������� � ���������� ����, ����� �����, ������� ���������� �������, �������� ��������� �������� � ����� � ������, ���������� ����� � ������� ���������'),
('����� ������. ������� ����������� �����������. �� ������� �� ������������ ���������', '����� ������', '978-5-17-080480-1', 2014, 0, '����� ����������� ������ ������ �������, ������������ �� 10 ���, �������� � ���� ������������ ������ � �������������. ��������� ����� �������� �� ������������ �������: ������� ������ � ������ ����� � ������������ ���������� ��������.'),
('������� ����������� �����������. ������������ �����. ����� 2. ����� ����. ��������� ������', '����� ������', '978-5-17-082524-0', 2014, 0, '"� ��������� ������ ������ ���� ����� ��������, ��������� ������������ ���������, � ����������, ������� ������� ������ ��� ����������������. ����� ������������ ����������� � ������� ������� - ����� ������������.'),
('���� �� ������', '��������� ������', '978-5-00108-008-4', 2017, 0, '����� �������� �������� � �������� �������� ������������ - �� ������ �������� ����� �� �������� �����.'),
('����� � ������������� ������', '�������� ��������', '978-5-00108-061-9', 2017, 0, '������, ��������� ������� ����, ����������� ������ ����� ����� � ���� ������, � ��������� ����������-��������� ������. �������, ��������, ������ �������, ����� ����, ����� �������� ������ �����'),
('������ �� ������', '�������� �������', '978-5-00108-049-7', 2017, 0, '�������� ���� �������� �� ���� ����� - ����� ����������, �������� ����� � �����, ����������� ��� ��������, ��������� ������������ ��������� ����� � ������� � ������������� ����������.'),
('������� �����', '������� �����', '978-5-91045-998-8', 2017, 0, '������������ � ����� ������������ ���� ��� ����� �������� ��������� �������� � ������������� ����� ����� � ������� ������ ������������ ������ � ������������ ���������� ��������� �����������.'),
('���� "���" �� �������', '�������� ��������', '978-5-00108-010-7', 2017, 0, '������������ ������� � ��� ��������� ���������, ������� �������� � �������. ����� ������� �������������� �������, �������� ������ ������ �������.'),
('������ �� ����-����', '�������� ��������', '978-5-00108-035-0', 2017, 0, '������ �� 4 "�" ������������ � ������������� ����������. �� ��������� ������� ���� ���� ��������������� ������� ��� ���� ����� ������: ������������ � ������ ���������, ����������� � ��������.'),

('������ ���������', '����� ����������', '978-5-00108-040-4', 2017, 0, '�� �����, ��� ����� ������ ��������� ������� �������� �� ���� ��� �����, ��� �� ����� ������������ � ����� ������?'),
('� ������� ����', '� ������� ����', '978-5-9287-2395-8', 2013, 0, '� 1960-� ����� ������� �. �. ������ ������� ����� "� ������� ����", � ��������� ��������� �������� 1812 �����.'),
('���� � �������� �����', '����� ����', '978-5-00108-020-6', 2017, 0, '������ ����� ����� "���� ������ ����� �����". � ������� - ����������� ������� "���� � �������� �����", ����������� ���� ������������ � ���������� ������ ������� ������ � ��� ���������� ������� �������.'),
('���� ������', '����� ����', '978-5-00108-032-9', 2017, 0, '������ ����� ����� "���� ������ ����� �����" - "���� ������" � ������������� ������������� ������� ��������� � ������������ ����������� ������� ���������.')
;
