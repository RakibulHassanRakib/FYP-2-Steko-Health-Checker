import 'package:flutter/material.dart';
import '../widgets/custom_elevated_button_gradient.dart';

class TermsOfUse extends StatelessWidget {
  static const id = '/terms-of-use';

  const TermsOfUse({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: const BackButton(
            color: Colors.black54,
          ),
          title: const Text(
            'Terms of Use',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black54,
              fontSize: 16.0,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0.2,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(30.0),
                  child: const Text(
                    'Privacy Policy Steko website is owned by Steko health Checker, which is a data controller of your personal data. We have adopted this Privacy Policy, which determines how we are processing the information collected by Steko, which also provides the reasons why we must collect certain personal data about you. Therefore, you must read this Privacy Policy before using Steko website. We take care of your personal data and undertake to guarantee its confidentiality and security. Personal information we collect: When you visit the Steko, we automatically collect certain information about your device, including information about your web browser, IP address, time zone, and some of the installed cookies on your device. Additionally, as you browse the Site, we collect information about the individual web pages or products you view, what websites or search terms referred you to the Site, and how you interact with the Site. We refer to this automatically-collected information as “Device Information.” Moreover, we might collect the personal data you provide to us (including but not limited to Name, Surname, Address, payment information, etc.) during registration to be able to fulfill the agreement. Why do we process your data? Our top priority is customer data security, and, as such, we may process only minimal user data, only as much as it is absolutely necessary to maintain the website. Information collected automatically is used only to identify potential cases of abuse and establish statistical information regarding website usage. This statistical information is not otherwise aggregated in such a way that it would identify any particular user of the system. You can visit the website without telling us who you are or revealing any information, by which someone could identify you as a specific, identifiable individual. If, however, you wish to use some of the website’s features, or you wish to receive our newsletter or provide other details by filling a form, you may provide personal data to us, such as your email, first name, last name, city of residence, organization, telephone number. You can choose not to provide us with your personal data, but then you may not be able to take advantage of some of the website’s features. For example, you won’t be able to receive our Newsletter or contact us directly from the website. Users who are uncertain about what information is mandatory are welcome to contact us via stekohealthchecker@gmail.com. Your rights: If you are a European resident, you have the following rights related to your personal data: The right to be informed. The right of access. The right to rectification. The right to erasure. The right to restrict processing. The right to data portability. The right to object. Rights in relation to automated decision-making and profiling. If you would like to exercise this right, please contact us through the contact information below. Additionally, if you are a European resident, we note that we are processing your information in order to fulfill contracts we might have with you (for example, if you make an order through the Site), or otherwise to pursue our legitimate business interests listed above. Additionally, please note that your information might be transferred outside of Europe, including Canada and the United States. Links to other websites: Our website may contain links to other websites that are not owned or controlled by us. Please be aware that we are not responsible for such other websites or third parties',
                    style: TextStyle(
                      color: Color(0xFF4A4949),
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  CustomElevatedButtonGradient(
                    child: const Text(
                      'Aggress to Terms',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    height: 60.0,
                    borderRadius: BorderRadius.circular(4.0),
                    width: double.infinity,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'Decline',
                      style: TextStyle(
                        color: Color(0xFFE63946),
                      ),
                    ),
                  ),
                  const Text(
                    'By tapping “Agree to Terms” you accept our Privacy Policy and Term of Use',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFADA4A5),
                      fontSize: 10.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
