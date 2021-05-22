module ApplicationHelper
    def qr_gen(event, name)
        require 'rqrcode'
        qrcode = RQRCode::QRCode.new("#{event} - #{name}")
        svg = qrcode.as_svg(
        offset: 0,
        color: '000',
        shape_rendering: 'crispEdges',
        module_size: 5,
        standalone: true
        ).html_safe
    end
end
