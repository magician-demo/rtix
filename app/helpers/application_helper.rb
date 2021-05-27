module ApplicationHelper
    def qr_gen(event, ticket_name, ticket_area, seat_id )
        require 'rqrcode'
        qrcode = RQRCode::QRCode.new("#{event} - #{ticket_name}- #{ticket_area} - #{seat_id}")
        svg = qrcode.as_svg(
        offset: 0,
        color: '000',
        shape_rendering: 'crispEdges',
        module_size: 5,
        standalone: true
        )
    end
end
