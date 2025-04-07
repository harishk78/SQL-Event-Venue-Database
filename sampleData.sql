INSERT INTO customer VALUES ( customer_t('C0001', 'john.doe@hotmail.com', 'Wheelchair Accessible', name_t('John', 'Doe')) ); 

INSERT INTO customer VALUES ( customer_t('C0002', 'jane.smith@gmail.com', 'None', name_t('Jane', 'Smith')) ); 

INSERT INTO customer VALUES ( customer_t('C0003', 'bob.johnson@outlook.com', 'Hearing Impairment Support', name_t('Bob', 'Johnson')) ); 

INSERT INTO customer VALUES ( customer_t('C0004', 'alice.brown@yahoo.com', 'None', name_t('Alice', 'Brown')) ); 


INSERT INTO payment VALUES (
    payment_t('7612483910563741', 'Jane Smith', '456')
);

INSERT INTO payment VALUES (
    payment_t('9173520834615784', 'Bob Johnson', '543')
);

INSERT INTO payment VALUES (
    payment_t('6504138749203765', 'Alice Brown', '783')
);


INSERT INTO ARTIST VALUES (
    artist_t(
        'A01', 
        'concert', 
        TO_DATE('2024-05-01', 'YYYY-MM-DD'), 
        TIMESTAMP '2024-05-01 20:00:00', 
        TIMESTAMP '2024-05-01 22:00:00', 
        1000, 
        12000.00, 
        4000.00, 
        'Lil Jo$h'
    )
);
INSERT INTO ARTIST VALUES (
    artist_t(
        'A02', 
        'concert', 
        TO_DATE('2024-10-31', 'YYYY-MM-DD'), 
        TIMESTAMP '2024-10-31 20:00:00', 
        TIMESTAMP '2024-10-31 22:00:00', 
        2000, 
        50000.00, 
        4000.00, 
        'Taylor Swift'
    )
);

INSERT INTO ARTIST VALUES (
    artist_t(
        'A03', 
        'concert', 
        TO_DATE('2024-06-02', 'YYYY-MM-DD'), 
        TIMESTAMP '2024-06-02 19:00:00', 
        TIMESTAMP '2024-06-02 22:00:00', 
        2000, 
        50000.00, 
        6000.00, 
        'Drake'
    )
);

INSERT INTO ARTIST VALUES (
    artist_t(
        'A04', 
        'concert', 
        TO_DATE('2024-08-13', 'YYYY-MM-DD'), 
        TIMESTAMP '2024-08-13 20:00:00', 
        TIMESTAMP '2024-08-13 22:00:00', 
        2000, 
        6000.00, 
        2000.00, 
        'Zara Larsson'
    )
);


INSERT INTO Sports VALUES (
    sports_t(
        'S01', 
        'Sporting Event', 
        TO_DATE('2024-01-01', 'YYYY-MM-DD'), 
        TIMESTAMP '2024-01-01 20:00:00', 
        TIMESTAMP '2024-01-01 23:00:00', 
        2000, 
        80000.00, 
        20000.00, 
        'Raptors vs Wolves'
    )
);

INSERT INTO Sports VALUES (
    sports_t(
        'S02', 
        'Sporting Event', 
        TO_DATE('2024-07-01', 'YYYY-MM-DD'), 
        TIMESTAMP '2024-07-01 20:00:00', 
        TIMESTAMP '2024-07-01 23:00:00', 
        2000, 
        90000.00, 
        20000.00, 
        'Heat vs Bulls'
    )
);

INSERT INTO Sports VALUES (
    sports_t(
        'S03', 
        'Sporting Event', 
        TO_DATE('2024-03-15', 'YYYY-MM-DD'), 
        TIMESTAMP '2024-03-15 19:00:00', 
        TIMESTAMP '2024-03-15 22:00:00', 
        1900, 
        75000.00, 
        15000.00, 
        'Leafs vs Jets'
    )
);

INSERT INTO Sports VALUES (
    sports_t(
        'S04', 
        'Sporting Event', 
        TO_DATE('2024-08-10', 'YYYY-MM-DD'), 
        TIMESTAMP '2024-08-10 18:00:00', 
        TIMESTAMP '2024-08-10 21:00:00', 
        2000, 
        95000.00, 
        25000.00, 
        'Ducks vs Stars'
    )
);

INSERT INTO Sports VALUES (
    sports_t(
        'S05', 
        'Sporting Event', 
        TO_DATE('2024-03-10', 'YYYY-MM-DD'), 
        TIMESTAMP '2024-03-10 18:00:00', 
        TIMESTAMP '2024-03-10 23:00:00', 
        2000, 
        90000.00, 
        35000.00, 
        'Rams vs Sharks'
    )
);

INSERT INTO Sports VALUES (
    sports_t(
        'S06', 
        'Sporting Event', 
        TO_DATE('2024-03-15', 'YYYY-MM-DD'), 
        TIMESTAMP '2024-03-15 15:00:00', 
        TIMESTAMP '2024-03-15 16:00:00', 
        2000, 
        90000.00, 
        35000.00, 
        'Dogs vs Cats'
    )
);


INSERT INTO foodsales VALUES (
foodsales_t( 'F0001', 'Burger', 50, 5.99, (SELECT REF(s) FROM sports s WHERE s.eid = 'S03'))
);

INSERT INTO foodsales VALUES ( 
    foodsales_t('F0002', 'Nachos', 30, 4.00, 
                 (SELECT REF(s) FROM sports s WHERE s.eid = 'S01'))
);

INSERT INTO foodsales VALUES (
    foodsales_t('F0003', 'Popcorn', 100, 2.50, 
                 (SELECT REF(a) FROM artist a WHERE a.eid = 'A02'))
);

INSERT INTO foodsales VALUES (
    foodsales_t('F0004', 'Soda', 75, 1.50,  
                 (SELECT REF(a) FROM artist a WHERE a.eid = 'A01'))
);

INSERT INTO foodsales VALUES (
    foodsales_t('F0005', 'Water', 75, 1.50,  
                 (SELECT REF(a) FROM artist a WHERE a.eid = 'A01'))
);

INSERT INTO ticket VALUES ( ticket_t('T0001', 'P0001', TO_DATE('2024-10-31', 'YYYY-MM-DD'),180.00, (select ref(a) from allocatedseat a where a.asid= '001'), (select ref(c) from cart c where c.cartId= 'CT001'))
); 

INSERT INTO ticket VALUES ( ticket_t('T0002', 'P0002', TO_DATE('2024-10-31', 'YYYY-MM-DD'),180.00, (select ref(a) from allocatedseat a where a.asid= '002'), (select ref(c) from cart c where c.cartId= 'CT002'))
); 

INSERT INTO ticket VALUES ( ticket_t('T0003', 'P0003', TO_DATE('2024-12-29', 'YYYY-MM-DD'),180.00, (select ref(a) from allocatedseat a where a.asid= '003'), (select ref(c) from cart c where c.cartId= 'CT003'))
); 

INSERT INTO ticket VALUES ( ticket_t('T0004', 'P0004', TO_DATE('2024-12-28', 'YYYY-MM-DD'),80.00, (select ref(a) from allocatedseat a where a.asid= '004'), (select ref(c) from cart c where c.cartId= 'CT004'))
); 

INSERT INTO ticket VALUES ( ticket_t('T0005', 'P0005', TO_DATE('2024-11-28', 'YYYY-MM-DD'),80.00, (select ref(a) from allocatedseat a where a.asid= '005'), (select ref(c) from cart c where c.cartId= 'CT005'))
); 

INSERT INTO ticket VALUES ( ticket_t('T0006', 'P0006', TO_DATE('2024-11-29', 'YYYY-MM-DD'),190.00, (select ref(a) from allocatedseat a where a.asid= '006'), (select ref(c) from cart c where c.cartId= 'CT006'))
); 


INSERT INTO cart VALUES (
    cart_t(
        'CT001',
        'CF001',
        'Raptors GA seats',
        (SELECT REF(p) FROM payment p WHERE p.cardnumber = '4938572019478623'),
        (SELECT REF(c) FROM customer c WHERE c.customerID = 'C0001')
    )
);



INSERT INTO cart VALUES (
    cart_t(
        'CT002',
        'CF002',
        'Ducks GA seats',
        (SELECT REF(p) FROM payment p WHERE p.cardnumber = '7612483910563741'),
        (SELECT REF(c) FROM customer c WHERE c.customerID = 'C0002')
    )
);

INSERT INTO cart VALUES (
    cart_t(
        'CT003',
        'CF003',
        'Drake Floor seats',
        (SELECT REF(p) FROM payment p WHERE p.cardnumber = '6504138749203765'),
        (SELECT REF(c) FROM customer c WHERE c.customerID = 'C0003')
    )
);

INSERT INTO cart VALUES (
    cart_t(
        'CT004',
        'CF004',
        'Lil Jo$h GA seats',
        (SELECT REF(p) FROM payment p WHERE p.cardnumber = '9173520834615784'),
        (SELECT REF(c) FROM customer c WHERE c.customerID = 'C0003')
    )
);

INSERT INTO cart VALUES (
    cart_t(
        'CT005',
        'CF005',
        'Taylor Swift GA seats',
        (SELECT REF(p) FROM payment p WHERE p.cardnumber = '9173520834615784'),
        (SELECT REF(c) FROM customer c WHERE c.customerID = 'C0003')
    )
);

INSERT INTO cart VALUES (
    cart_t(
        'CT006',
        'CF006',
        'Taylor Swift GA seats',
        (SELECT REF(p) FROM payment p WHERE p.cardnumber = '4938572019478623'),
        (SELECT REF(c) FROM customer c WHERE c.customerID = 'C0001')
    )
);

INSERT INTO seat VALUES (seat_t('001')); 

INSERT INTO seat VALUES (seat_t('002')); 

INSERT INTO seat VALUES (seat_t('003')); 

INSERT INTO seat VALUES (seat_t('004')); 


INSERT INTO allocatedseat VALUES (allocatedseat_t('001', 
 (select ref(s) from seat s where s.seatID= '003'), (select ref(a) from artist a where a.eid= 'A03'))
); 

INSERT INTO allocatedseat VALUES (allocatedseat_t('002', 
(select ref(s) from seat s where s.seatID= '002'), (select ref(a) from artist a where a.eid= 'A01'))
); 

INSERT INTO allocatedseat VALUES ( allocatedseat_t('003', 
 (select ref(s) from seat s where s.seatID= '002'),(select ref(sp) from sports sp where sp.eid= 'S01'))
); 

INSERT INTO allocatedseat VALUES ( allocatedseat_t('004', 
 (select ref(s) from seat s where s.seatID= '001'),(select ref(sp) from sports sp where sp.eid= 'S02'))
); 

INSERT INTO allocatedseat VALUES (allocatedseat_t('005', 
(select ref(s) from seat s where s.seatID= '002'), (select ref(a) from artist a where a.eid= 'A02'))
); 

INSERT INTO allocatedseat VALUES (allocatedseat_t('006', 
(select ref(s) from seat s where s.seatID= '003'), (select ref(a) from artist a where a.eid= 'A02'))
); 

INSERT INTO sponsor VALUES (sponsor_t('SP0001', 'AlphaCorp', 50000.00, TO_DATE('2023-01-01', 'YYYY-MM-DD'), TO_DATE('2024-01-01', 'YYYY-MM-DD'), (select ref(a) from artist a where a.eid= 'A03'))
);

INSERT INTO sponsor VALUES (sponsor_t('SP0002', 'Rogers', 75000.00, TO_DATE('2022-05-15', 'YYYY-MM-DD'), TO_DATE('2025-05-15', 'YYYY-MM-DD'),
(select ref(s) from sports s where s.eid= 'S01'))
);

INSERT INTO sponsor VALUES (sponsor_t('SP0003', 'TD bank', 30000.00, TO_DATE('2023-07-01', 'YYYY-MM-DD'), TO_DATE('2024-07-01', 'YYYY-MM-DD'),
(select ref(a) from artist a where a.eid= 'A03'))
);

INSERT INTO sponsor VALUES (sponsor_t('SP0004', 'DeltaGroup', 100000.00, TO_DATE('2021-03-10', 'YYYY-MM-DD'), TO_DATE('2026-03-10', 'YYYY-MM-DD'),
(select ref(s) from sports s where s.eid= 'S03'))
);

