create type customer_t as object(
customerID char(5),
emailaddress varchar(50),
accommodation varchar(50),
cname name_t
);

create type payment_t as object(
cardnumber char(20),
cardholdername varchar2(20),
cvv integer
);

Create or replace type event_t as object(
eid char(3),
eventType varchar2(15),
eventDate date,
startTime Timestamp,
endTime Timestamp,
ticketsSold integer,
revenue decimal,
expenses decimal,
Map member function eventDuration return interval day to second,
member function emptySeat return integer,
member function calculateProfit return decimal,
member function eventDetails return varchar2
) not final;

Create type artist_t under event_t(
aName varchar2(20),
overriding member function eventDetails return varchar2
); 

Create type sports_t under event_t(
sName varchar2(20),
overriding member function eventDetails return varchar2
);

create type sponsor_t as object(
sid char(6),
sname varchar2(15),
moneysponsored decimal,
contractstart date,
contractend date,
eoID ref event_t, 
map member function contractLength return integer
);

create type  _t as object(
fID char(5),
foodname char(15),
quantity integer,
price decimal(10, 2),
eoID ref event_t,
member function checkInventory return varchar2
);


Create or replace type ticket_t as object(
tID char(5),
pID char(5),
tDate DATE,
price decimal(10,2),
ASOID ref allocatedseat_t,
coid ref cart_t,
order member function compareTicketPrice(TP in ticket_t) return integer
);

Create type seat_t as object(seatID char(3));

Create type allocatedseat_t as object(ASID char(3), soID ref seat_t, eoID ref event_t);

create type cart_t as object(cartID char(5), confirmationID char(5), ticketname varchar(30), 
cardNum ref payment_t, customerID ref customer_t,
Member function getCartDetails return varchar2); 


Create or replace type body event_t as
map member function eventDuration return interval day to second is
Duration interval day to second;
Begin
Duration := self.endTime- self.startTime;
Return duration;
End;

Member function emptySeat return integer is
remainingAttendees integer;
Begin
	remainingAttendees:= 2000 - self.ticketsSold;
Return remainingAttendees;
End;

Member function calculateProfit return decimal is	
Profit decimal;
Begin
Profit := self.revenue - self.expenses;
return profit;
End;

Member function eventDetails return varchar2 is
Begin
Return 'Event Type: ' || self.eventType ||
'Date: ' || self.eventDate ||
'Start Time: ' || self.startTime ||
'End Time: ' || self.endTime; 
End;
end;

Create or replace type body foodsales_t as
member function checkInventory return varchar2 is
Begin
Return self.foodName || ' quantity is ' || self.quantity;
End;
end; 

Create or replace type body name_t as
member function getname return varchar2 is
Begin
Return self.firstName || ' ' || self.lastName;
End;
end;


Create or replace type body cart_t as
member function getCartDetails return varchar2 is
Begin
Return 'Cart ID: ' || self.cartID ||
' Confirmation ID: ' || self.confirmationID ||
' Ticket Name: ' || self.ticketName;
End;
end;

Create or replace type body ticket_t as
	Order member function compareTicketPrice(TP in ticket_t) return integer is
	Result integer;
	Begin
		If self.price < TP.price then
			Result:= -1;
		Else if self.price > TP.price then
			Result:= 1;
		Else
			Result:= 0;
		End if;
		End if;
		Return result;
	End;
End;

CREATE OR REPLACE TYPE BODY sponsor_t AS
    MAP MEMBER FUNCTION contractLength RETURN INTEGER IS
        contLength INTEGER;
    BEGIN
        contLength := TRUNC(self.contractEnd - self.contractStart);
        RETURN contLength;
    END;
END;

Create or replace type body artist_t as
Overriding member function eventDetails return varchar2 is
Begin
Return 'Artist Event: ' || self.aName || ', Event Type: ' || self.eventType || ', Date: ' || to_char(self.eventDate, 'YYYY-MM-DD') || ', Start Time: ' || to_char(self.startTime, 'HH24:MI:SS') || ', End Time: ' || to_char(self.endTime, 'HH24:MI:SS');
	End;
End;

Create or replace type body sports_t as
	Overriding member function eventDetails return varchar2 is
	Begin
Return 'Sports Event: ' || self.sName ||
', Event Type: ' || self.eventType ||
', Date: ' || to_char(self.eventDate, 'YYYY-MM-DD') ||
', Start Time: ' || to_char(self.startTime, 'HH24:MI:SS') ||
', End Time: ' || to_char(self.endTime, 'HH24:MI:SS');
	End;
End;

create table ticket of ticket_t(tid primary key);

create table allocatedseat of allocatedseat_t(asid primary key);

create table seat of seat_t(seatID primary key);

create table sponsor of sponsor_t(sid primary key); 

create table foodsales of foodsales_t(fid primary key);

create table cart of cart_t(cartid primary key);

Create table payment of payment_t(cardnumber primary key);

create table artist of artist_t(eid primary key);

create table sports of sports_t(eid primary key); 

Create table customer of customer_t(customerID primary key);

