package com.fashionshop.helper;

public class MailMessenger {

	public static void successfullyRegister(String userName, String userEmail) {

		String subject = "Chào mừng đến với FashionShop - Đăng ký thành công!";
		String body = "Chào " + userName
				+ ",<br>Chúc mừng và chào mừng bạn đến với fashionshop! Chúng tôi rất vui mừng khi có bạn là một phần của cộng đồng đang phát triển của chúng tôi. Cảm ơn bạn đã chọn chúng tôi cho nhu cầu mua sắm trực tuyến của bạn.<br>"
				+ "Đăng ký của bạn đã thành công, và chúng tôi rất vui mừng thông báo rằng bạn hiện là một thành viên quý giá của nền tảng của chúng tôi. Với fashionshop, bạn sẽ khám phá một loạt các sản phẩm và các ưu đãi thú vị phù hợp với sở thích và nhu cầu của bạn.<br>"
				+ "Một lần nữa, chào mừng bạn! Chúng tôi mong được phục vụ bạn và làm cho trải nghiệm mua sắm của bạn trở nên thú vị và đáng nhớ.<br>"
				+ "Chúc bạn mua sắm vui vẻ!";
		try {
			Mail.sendMail(userEmail, subject, body);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void successfullyOrderPlaced(String userName, String userEmail, String orderId, String OrderDate) {
		String subject = "Xác Nhận Đơn Hàng - Sản Phẩm Của Bạn Đang Trên Đường!";
		String body = "Chào " + userName
				+ ",<br>Chúng tôi rất vui mừng thông báo rằng đơn hàng của bạn đã được đặt thành công và hiện đang được xử lý. Cảm ơn bạn đã chọn fashionshop cho nhu cầu mua sắm của mình!<br>"
				+ "<b>Chi Tiết Đơn Hàng:</b><br>" + "Số Đơn Hàng: " + orderId + "<br>Ngày Đặt Hàng: " + OrderDate
				+ "<br>"
				+ "Xin lưu ý rằng đơn hàng của bạn hiện đang được chuẩn bị để giao hàng. Đội ngũ tận tâm của chúng tôi đang làm việc chăm chỉ để đảm bảo rằng sản phẩm của bạn được đóng gói an toàn và gửi đi sớm nhất có thể.<br>"
				+ "Khi đơn hàng của bạn được gửi đi, chúng tôi sẽ gửi cho bạn một email khác chứa thông tin theo dõi, cho phép bạn theo dõi hành trình của nó cho đến khi đến tay bạn. Chúng tôi hiểu rằng việc nhận được một gói hàng là rất thú vị, và chúng tôi sẽ cố gắng hết sức để giao nó cho bạn sớm nhất có thể.<br>"
				+ "Cảm ơn bạn đã mua sắm với chúng tôi! Sự tin tưởng của bạn vào fashionshop có ý nghĩa rất lớn đối với chúng tôi, và chúng tôi hứa sẽ mang đến cho bạn một trải nghiệm mua sắm tuyệt vời.";
		try {
			Mail.sendMail(userEmail, subject, body);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void orderShipped(String userName, String userEmail, String orderId, String OrderDate) {
		String subject = "Đơn Hàng Của Bạn Đang Được Giao!";
		String body = "Chào " + userName
				+ ",<br>Xin chào từ fashionshop! Chúng tôi rất vui mừng thông báo rằng đơn hàng của bạn đang trên đường đến bạn. Gói hàng của bạn đã được gửi đi thành công và sẽ sớm đến tay bạn!<br>"
				+ "<b>Chi Tiết Đơn Hàng:</b><br>" + "Số Đơn Hàng: " + orderId + "<br>Ngày Đặt Hàng: " + OrderDate
				+ "<br>"
				+ "Đội ngũ tận tâm của chúng tôi đã xử lý và đóng gói đơn hàng của bạn một cách cẩn thận để đảm bảo rằng nó đến tay bạn trong tình trạng hoàn hảo. Khi đơn hàng đang được giao, đối tác giao hàng đáng tin cậy của chúng tôi cam kết mang gói hàng đến bạn nhanh nhất có thể.<br>"
				+ "Một lần nữa, chúng tôi cảm ơn sự tin tưởng của bạn vào fashionshop cho nhu cầu mua sắm của mình. Chúng tôi mong muốn mang đến cho bạn một trải nghiệm mua sắm tuyệt vời, và sự hài lòng của bạn là ưu tiên hàng đầu của chúng tôi.<br>"
				+ "Cảm ơn bạn đã chọn chúng tôi!";
		try {
			Mail.sendMail(userEmail, subject, body);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void sendOtp(String userEmail, int code) {

		String subject = "Mã xác minh để thay đổi mật khẩu";
		String body = "Chào, " + "Vui lòng sử dụng mã xác minh dưới đây để đặt lại mật khẩu của bạn!" + "<br>" + code
				+ "<br>";
		try {
			Mail.sendMail(userEmail, subject, body);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
