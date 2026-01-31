# Room Booking Feature — Design Proposal

**Project:** wedding-rsvp
**Feature:** Guest room booking for wedding attendees
**Author:** Claw (LLAB-Machina)

## Overview

Allow wedding guests to book rooms at the venue or nearby accommodations through the RSVP system.

## Database Schema

### Rooms Table
```sql
CREATE TABLE rooms (
    id UUID PRIMARY KEY,
    company_id UUID REFERENCES companies(id),
    name VARCHAR(100) NOT NULL, -- e.g., "Grand Suite", "Standard Room"
    description TEXT,
    capacity INT NOT NULL, -- max guests
    bed_type VARCHAR(50), -- "King", "Queen", "Two Twins", etc.
    amenities TEXT[], -- ["ensuite bathroom", "balcony", "sea view"]
    price_per_night DECIMAL(10,2), -- NULL if free for guests
    is_active BOOLEAN DEFAULT true,
    sort_order INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);
```

### RoomBookings Table
```sql
CREATE TABLE room_bookings (
    id UUID PRIMARY KEY,
    company_id UUID REFERENCES companies(id),
    guest_id UUID REFERENCES guests(id), -- link to wedding guest
    room_id UUID REFERENCES rooms(id),
    check_in DATE NOT NULL,
    check_out DATE NOT NULL,
    number_of_guests INT NOT NULL DEFAULT 1,
    status VARCHAR(20) DEFAULT 'pending', -- pending, confirmed, cancelled
    notes TEXT, -- dietary requirements, accessibility needs, etc.
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW(),
    
    CONSTRAINT valid_dates CHECK (check_out > check_in),
    CONSTRAINT max_guests CHECK (number_of_guests > 0)
);
```

## API Endpoints

### Admin Endpoints (Theodor/Rebecca)
- `GET /api/rooms` — List all rooms
- `POST /api/rooms` — Create room
- `PATCH /api/rooms/:id` — Update room
- `DELETE /api/rooms/:id` — Soft delete (set is_active=false)
- `GET /api/room-bookings` — List all bookings
- `PATCH /api/room-bookings/:id/status` — Confirm/cancel booking

### Guest Endpoints
- `GET /api/rooms/available` — List available rooms for date range
- `POST /api/room-bookings` — Create booking request
- `GET /api/room-bookings/my` — View my bookings
- `PATCH /api/room-bookings/:id/cancel` — Cancel my booking

## Frontend Pages

### Admin
- `/admin/rooms` — Room management list
- `/admin/rooms/new` — Create room
- `/admin/rooms/:id/edit` — Edit room
- `/admin/room-bookings` — All bookings view

### Guest
- `/rsvp/rooms` — Browse and book rooms (part of RSVP flow)
- `/rsvp/my-booking` — View/cancel my booking

## Open Questions (for Theodor)

1. **Which rooms?** Names, capacity, bed types, amenities
2. **Pricing?** Free for guests or charge per night?
3. **Dates?** Wedding weekend only or flexible?
4. **Room sharing?** Couples share by default or book separately?
5. **Priority?** Family first, then friends?
6. **Payment?** Integrated or offline?

## Implementation Plan

### Phase 1: Backend (Day 1)
- [ ] Database migrations
- [ ] Room service + handlers
- [ ] Room booking service + handlers
- [ ] Tests

### Phase 2: Frontend Admin (Day 2)
- [ ] Room list page
- [ ] Room create/edit forms
- [ ] Bookings management page

### Phase 3: Frontend Guest (Day 3)
- [ ] Room browsing in RSVP flow
- [ ] Booking form
- [ ] My booking view

### Phase 4: Polish (Day 4)
- [ ] Email notifications
- [ ] Conflict handling
- [ ] Admin dashboard widgets

---

**Ready to start once Theodor answers the questions.**
