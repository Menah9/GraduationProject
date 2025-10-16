from odoo import models, fields

class GPBooking(models.Model):
    _name = "gp.booking"
    _description = "Chalet Booking"

    name = fields.Char(required=True)
    chalet_id = fields.Many2one("gp.chalet", string="Chalet", required=True)
    partner_id = fields.Many2one("res.partner", string="Customer")
    start_date = fields.Date()
    end_date = fields.Date()
    state = fields.Selection([
        ("draft", "Draft"),
        ("confirmed", "Confirmed"),
        ("cancelled", "Cancelled")
    ], default="draft")
