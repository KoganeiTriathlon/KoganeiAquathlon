function testCertificate() {
	var doc = new jsPDF();
	doc.text(20, 20, 'Hello world!');
	doc.text(20, 30, 'This is client-side Javascript, pumping out a PDF.');
//	doc.addPage();//とりあえずコメントアウト。
	doc.text(20, 50, 'Do you like that?');
	
	// Save the PDF
	doc.save('TestCertificate.pdf');
}
