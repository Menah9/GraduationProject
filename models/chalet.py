from odoo import models, fields

class GPChalet(models.Model):
    _name = "gp.chalet"
    _description = "Chalet"

    name = fields.Char(required=True)
    description = fields.Text()
    price = fields.Float(string="Price per Night")
    status = fields.Selection([
        ("available", "Available"),
        ("unavailable", "Unavailable")
    ], default="available")

    booking_ids = fields.One2many("gp.booking", "chalet_id", string="Bookings")
