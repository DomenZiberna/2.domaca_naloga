-- Kateri nakup je bil najdražji? Kateri najcenejši? --
select max(invoice.total) from Invoice

-- V katerem mestu je bilo največ nakupov? --
select Invoice.BillingCity, count(*) as Invoice_num FROM Invoice
GROUP by Invoice.BillingCity
ORDER by Invoice_num DESC

-- Izračunaj oziroma preštej, koliko skladb (Track) je tipa (MediaType) Protected AAC audio file. --
SELECT count(*)
from Track  JOIN MediaType on track.MediaTypeId=MediaType.MediaTypeId
WHERE MediaType.Name = 'Protected AAC audio file'

-- Ugotovi, kateri izvajalec (Artist) ima največ albumov. --
SELECT Artist.Name, count(*)
FROM Artist JOIN Album on Artist.ArtistId=Album.ArtistId
GROUP by Artist.Name
ORDER by count(*) DESC

-- Kateri žanr (Genre) ima največ skladb (Track)? --
SELECT Genre.Name, count(*)
from Genre JOIN Track on Genre.GenreId=Track.GenreId
GROUP by Genre.GenreId
ORDER by count(*) DESC

-- Kateri kupec je do sedaj v trgovini zapravil največ? --
SELECT Customer.FirstName, Customer.LastName, sum(invoice.total)
from Customer JOIN Invoice on Customer.CustomerId=Invoice.CustomerId
GROUP by Customer.CustomerId
ORDER by sum(invoice.total) DESC

-- Izpiši vse račune in katere pesmi so bile kupljene na posameznem računu. --
SELECT invoice.InvoiceId, Invoice.InvoiceDate, Track.Name
from Track JOIN InvoiceLine on track.TrackId=InvoiceLine.TrackId
JOIN Invoice on InvoiceLine.InvoiceId=Invoice.InvoiceId
GROUP by Invoice.InvoiceId

-- Kateri kupci porabijo več denarja - tisti ki delajo za neko firmo, ali tisti, ki ne --
-- Tisti ki delajo za firmo - rezultat je 385,2.
SELECT sum(Invoice.Total)
from Customer JOIN Invoice on customer.CustomerId=invoice.CustomerId
WHERE Customer.Company is not null

-- Tisti ki ne delajo za firmo - rezultat je 1943,4.
SELECT sum(Invoice.Total)
from Customer JOIN Invoice on customer.CustomerId=invoice.CustomerId
WHERE Customer.Company is NULL
