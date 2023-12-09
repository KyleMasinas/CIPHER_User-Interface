import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'termsof_service_model.dart';
export 'termsof_service_model.dart';

class TermsofServiceWidget extends StatefulWidget {
  const TermsofServiceWidget({Key? key}) : super(key: key);

  @override
  _TermsofServiceWidgetState createState() => _TermsofServiceWidgetState();
}

class _TermsofServiceWidgetState extends State<TermsofServiceWidget>
    with TickerProviderStateMixin {
  late TermsofServiceModel _model;

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 300.ms),
        MoveEffect(
          curve: Curves.bounceOut,
          delay: 300.ms,
          duration: 400.ms,
          begin: Offset(0.0, 100.0),
          end: Offset(0.0, 0.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 300.ms,
          duration: 400.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TermsofServiceModel());

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).accent4,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 2.0, 16.0, 16.0),
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: 670.0,
                  ),
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 12.0,
                        color: Color(0x1E000000),
                        offset: Offset(0.0, 5.0),
                      )
                    ],
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(1.00, 0.00),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              9.0, 9.0, 9.0, 9.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.close,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 16.0, 0.0, 0.0),
                        child: Text(
                          'Terms of Service (\"Terms\")',
                          style: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .override(
                                fontFamily: 'Readex Pro',
                                fontSize: 25.0,
                              ),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Flexible(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      15.0, 15.0, 15.0, 15.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Text(
                                      'Our Terms of Service were last updated on 23/11/2023.\nPlease read these terms and conditions carefully before using Our Service.\n\nInterpretation and Definitions\n\nInterpretation\nThe words of which the initial letter is capitalized have meanings defined under the following conditions.\nThe following definitions shall have the same meaning regardless of whether they appear in singular or in\nplural.\nDefinitions\nFor the purposes of these Terms of Service:\n● “Affiliate” means an entity that controls, is controlled by or is under common control with a party,\nwhere \"control\" means ownership of 50% or more of the shares, equity interest or other securities\nentitled to vote for election of directors or other managing authority.\n● “Account” means a unique account created for You to access our Service or parts of our Service.\n● “Company” (referred to as either \"the Company\", \"We\", \"Us\" or \"Our\" in this Agreement) refers to USSC.\n● “Country” refers to Philippines.\n● “Content” refers to content such as text, images, or other information that can be posted, uploaded,\nlinked to or otherwise made available by You, regardless of the form of that content.\n● “Device” means any device that can access the Service such as a computer, a cell phone or a\ndigital tablet.\n● “Feedback” means feedback, innovations or suggestions sent by You regarding the attributes,\nperformance or features of our Service.\n● “Service” refers to the Website.\n● “Terms of Service” (also referred as \"Terms\") mean these Terms of Service that form the entire\nagreement between You and the Company regarding the use of the Service. This Terms of Service\nAgreement was generated by TermsFeed Terms of Service Generator.\n● “Third-party Social Media Service” means any services or content (including data, information,\nproducts or services) provided by a third-party that may be displayed, included or made available by\nthe Service.\n● “Website” refers to [WEBSITE_NAME], accessible from [WEBSITE_URL]\n● “You” means the individual accessing or using the Service, or the company, or other legal entity on\nbehalf of which such individual is accessing or using the Service, as applicable.\nAcknowledgment\nThese are the Terms of Service governing the use of this Service and the agreement that operates between\nYou and the Company. These Terms of Service set out the rights and obligations of all users regarding the\nuse of the Service.\nYour access to and use of the Service is conditioned on Your acceptance of and compliance with these\nTerms of Service. These Terms of Service apply to all visitors, users and others who access or use the\nService.\nBy accessing or using the Service You agree to be bound by these Terms of Service. If You disagree with\nany part of these Terms of Service then You may not access the Service.\nYou represent that you are over the age of 18. The Company does not permit those under 18 to use the\nService.\nYour access to and use of the Service is also conditioned on Your acceptance of and compliance with the\nPrivacy Policy of the Company. Our Privacy Policy describes Our policies and procedures on the collection,\nuse and disclosure of Your personal information when You use the Application or the Website and tells You\nabout Your privacy rights and how the law protects You. Please read Our Privacy Policy carefully before\nusing Our Service.\nUser Accounts\nWhen You create an account with Us, You must provide Us information that is accurate, complete, and\ncurrent at all times. Failure to do so constitutes a breach of the Terms, which may result in immediate\ntermination of Your account on Our Service.\nYou are responsible for safeguarding the password that You use to access the Service and for any activities\nor actions under Your password, whether Your password is with Our Service or a Third-Party Social Media\nService.\nYou agree not to disclose Your password to any third party. You must notify Us immediately upon becoming\naware of any breach of security or unauthorized use of Your account.\nYou may not use as a username the name of another person or entity or that is not lawfully available for\nuse, a name or trademark that is subject to any rights of another person or entity other than You without\nappropriate authorization, or a name that is otherwise offensive, vulgar or obscene.\nContent\nYour Right to Post Content\nOur Service allows You to post Content. You are responsible for the Content that You post to the Service,\nincluding its legality, reliability, and appropriateness.\nBy posting Content to the Service, You grant Us the right and license to use, modify, publicly perform,\npublicly display, reproduce, and distribute such Content on and through the Service. You retain any and all\nof Your rights to any Content You submit, post or display on or through the Service and You are responsible\nfor protecting those rights. You agree that this license includes the right for Us to make Your Content\navailable to other users of the Service, who may also use Your Content subject to these Terms.\nYou represent and warrant that: (i) the Content is Yours (You own it) or You have the right to use it and\ngrant Us the rights and license as provided in these Terms, and (ii) the posting of Your Content on or\nthrough the Service does not violate the privacy rights, publicity rights, copyrights, contract rights or any\nother rights of any person.\nContent Restrictions\nThe Company is not responsible for the content of the Service\'s users. You expressly understand and\nagree that You are solely responsible for the Content and for all activity that occurs under your account,\nwhether done so by You or any third person using Your account.\nYou may not transmit any Content that is unlawful, offensive, upsetting, intended to disgust, threatening,\nlibelous, defamatory, obscene or otherwise objectionable. Examples of such objectionable Content include,\nbut are not limited to, the following:\n● Unlawful or promoting unlawful activity.\n● Defamatory, discriminatory, or mean-spirited content, including references or commentary about\nreligion, race, sexual orientation, gender, national/ethnic origin, or other targeted groups.\n● Spam, machine – or randomly – generated, constituting unauthorized or unsolicited advertising,\nchain letters, any other form of unauthorized solicitation, or any form of lottery or gambling.\n● Containing or installing any viruses, worms, malware, trojan horses, or other content that is\ndesigned or intended to disrupt, damage, or limit the functioning of any software, hardware or\ntelecommunications equipment or to damage or obtain unauthorized access to any data or other\ninformation of a third person.\n● Infringing on any proprietary rights of any party, including patent, trademark, trade secret, copyright,\nright of publicity or other rights.\n● Impersonating any person or entity including the Company and its employees or representatives.\n● Violating the privacy of any third person.\n● False information and features.\nThe Company reserves the right, but not the obligation, to, in its sole discretion, determine whether or not\nany Content is appropriate and complies with this Terms, refuse or remove this Content. The Company\nfurther reserves the right to make formatting and edits and change the manner of any Content. The\nCompany can also limit or revoke the use of the Service if You post such objectionable Content. As the\nCompany cannot control all content posted by users and/or third parties on the Service, you agree to use\nthe Service at your own risk. You understand that by using the Service You may be exposed to content that\nYou may find offensive, indecent, incorrect or objectionable, and You agree that under no circumstances will\nthe Company be liable in any way for any content, including any errors or omissions in any content, or any\nloss or damage of any kind incurred as a result of your use of any content.\nContent Backups\nAlthough regular backups of Content are performed, the Company does not guarantee there will be no loss\nor corruption of data.\nCorrupt or invalid backup points may be caused by, without limitation, Content that is corrupted prior to\nbeing backed up or that changes during the time a backup is performed.\nThe Company will provide support and attempt to troubleshoot any known or discovered issues that may\naffect the backups of Content. But You acknowledge that the Company has no liability related to the\nintegrity of Content or the failure to successfully restore Content to a usable state.\nYou agree to maintain a complete and accurate copy of any Content in a location independent of the\nService.\nCopyright Policy\nIntellectual Property Infringement\nWe respect the intellectual property rights of others. It is Our policy to respond to any claim that Content\nposted on the Service infringes a copyright or other intellectual property infringement of any person.\nIf You are a copyright owner, or authorized on behalf of one, and You believe that the copyrighted work has\nbeen copied in a way that constitutes copyright infringement that is taking place through the Service, You\nmust submit Your notice in writing to the attention of our copyright agent via email\n([COPYRIGHT_AGENT_CONTACT_EMAIL]) and include in Your notice a detailed description of the\nalleged infringement.\nYou may be held accountable for damages (including costs and attorneys\' fees) for misrepresenting that\nany Content is infringing Your copyright.\nDMCA Notice and DMCA Procedure for Copyright Infringement Claims\nYou may submit a notification pursuant to the Digital Millennium Copyright Act (DMCA) by providing our\nCopyright Agent with the following information in writing (see 17 U.S.C 512(c)(3) for further detail):\n● An electronic or physical signature of the person authorized to act on behalf of the owner of the\ncopyright\'s interest.\n● A description of the copyrighted work that You claim has been infringed, including the URL (i.e., web\npage address) of the location where the copyrighted work exists or a copy of the copyrighted work.\n● Identification of the URL or other specific location on the Service where the material that You claim\nis infringing is located.\n● Your address, telephone number, and email address.\n● A statement by You that You have a good faith belief that the disputed use is not authorized by the\ncopyright owner, its agent, or the law.\n● A statement by You, made under penalty of perjury, that the above information in Your notice is\naccurate and that You are the copyright owner or authorized to act on the copyright owner\'s behalf.\nYou can contact our copyright agent via email ([COPYRIGHT_AGENT_CONTACT_EMAIL]). Upon receipt\nof a notification, the Company will take whatever action, in its sole discretion, it deems appropriate,\nincluding removal of the challenged content from the Service.\nIntellectual Property\nThe Service and its original content (excluding Content provided by You or other users), features and\nfunctionality are and will remain the exclusive property of the Company and its licensors.\nThe Service is protected by copyright, trademark, and other laws of both the Country and foreign countries.\nOur trademarks and trade dress may not be used in connection with any product or service without the prior\nwritten consent of the Company.\nYour Feedback to Us\nYou assign all rights, title and interest in any Feedback You provide the Company. If for any reason such\nassignment is ineffective, You agree to grant the Company a non-exclusive, perpetual, irrevocable, royalty\nfree, worldwide right and license to use, reproduce, disclose, sub-license, distribute, modify and exploit\nsuch Feedback without restriction.\nLinks to Other Websites\nOur Service may contain links to third-party web sites or services that are not owned or controlled by the\nCompany.\nThe Company has no control over, and assumes no responsibility for, the content, privacy policies, or\npractices of any third party web sites or services. You further acknowledge and agree that the Company\nshall not be responsible or liable, directly or indirectly, for any damage or loss caused or alleged to be\ncaused by or in connection with the use of or reliance on any such content, goods or services available on\nor through any such web sites or services.\nWe strongly advise You to read the terms and conditions and privacy policies of any third-party web sites or\nservices that You visit.\nTermination\nWe may terminate or suspend Your Account immediately, without prior notice or liability, for any reason\nwhatsoever, including without limitation if You breach these Terms of Service.\nUpon termination, Your right to use the Service will cease immediately. If You wish to terminate Your\nAccount, You may simply discontinue using the Service.\nLimitation of Liability\nNotwithstanding any damages that You might incur, the entire liability of the Company and any of its\nsuppliers under any provision of this Terms and Your exclusive remedy for all of the foregoing shall be\nlimited to the amount actually paid by You through the Service or 100 USD if You haven\'t purchased\nanything through the Service.\nTo the maximum extent permitted by applicable law, in no event shall the Company or its suppliers be liable\nfor any special, incidental, indirect, or consequential damages whatsoever (including, but not limited to,\ndamages for loss of profits, loss of data or other information, for business interruption, for personal injury,\nloss of privacy arising out of or in any way related to the use of or inability to use the Service, third-party\nsoftware and/or third-party hardware used with the Service, or otherwise in connection with any provision of\nthis Terms), even if the Company or any supplier has been advised of the possibility of such damages and\neven if the remedy fails of its essential purpose.\nSome states do not allow the exclusion of implied warranties or limitation of liability for incidental or\nconsequential damages, which means that some of the above limitations may not apply. In these states,\neach party\'s liability will be limited to the greatest extent permitted by law.\n\"AS IS\" and \"AS AVAILABLE\" Disclaimer\nThe Service is provided to You \"AS IS\" and \"AS AVAILABLE\" and with all faults and defects without\nwarranty of any kind. To the maximum extent permitted under applicable law, the Company, on its own\nbehalf and on behalf of its Affiliates and its and their respective licensors and service providers, expressly\ndisclaims all warranties, whether express, implied, statutory or otherwise, with respect to the Service,\nincluding all implied warranties of merchantability, fitness for a particular purpose, title and\nnon-infringement, and warranties that may arise out of course of dealing, course of performance, usage or\ntrade practice. Without limitation to the foregoing, the Company provides no warranty or undertaking, and\nmakes no representation of any kind that the Service will meet Your requirements, achieve any intended\nresults, be compatible or work with any other software, applications, systems or services, operate without\ninterruption, meet any performance or reliability standards or be error free or that any errors or defects can\nor will be corrected.\nWithout limiting the foregoing, neither the Company nor any of the company\'s provider makes any\nrepresentation or warranty of any kind, express or implied: (i) as to the operation or availability of the\nService, or the information, content, and materials or products included thereon; (ii) that the Service will be\nuninterrupted or error-free; (iii) as to the accuracy, reliability, or currency of any information or content\nprovided through the Service; or (iv) that the Service, its servers, the content, or e-mails sent from or on\nbehalf of the Company are free of viruses, scripts, trojan horses, worms, malware, timebombs or other\nharmful components.\nSome jurisdictions do not allow the exclusion of certain types of warranties or limitations on applicable\nstatutory rights of a consumer, so some or all of the above exclusions and limitations may not apply to You.\nBut in such a case the exclusions and limitations set forth in this section shall be applied to the greatest\nextent enforceable under applicable law.\nGoverning Law\nThe laws of the Country, excluding its conflicts of law rules, shall govern this Terms and Your use of the\nService. Your use of the Application may also be subject to other local, state, national, or international laws.\nDisputes Resolution\nIf You have any concern or dispute about the Service, You agree to first try to resolve the dispute informally\nby contacting the Company.\nFor European Union (EU) Users\nIf You are a European Union consumer, you will benefit from any mandatory provisions of the law of the\ncountry in which you are resident in.\nUnited States Legal Compliance\nYou represent and warrant that (i) You are not located in a country that is subject to the United States\ngovernment embargo, or that has been designated by the United States government as a \"terrorist\nsupporting\" country, and (ii) You are not listed on any United States government list of prohibited or\nrestricted parties.\nSeverability and Waiver\nSeverability\nIf any provision of these Terms is held to be unenforceable or invalid, such provision will be changed and\ninterpreted to accomplish the objectives of such provision to the greatest extent possible under applicable\nlaw and the remaining provisions will continue in full force and effect.\nWaiver\nExcept as provided herein, the failure to exercise a right or to require performance of an obligation under\nthese Terms shall not effect a party\'s ability to exercise such right or require such performance at any time\nthereafter nor shall the waiver of a breach constitute a waiver of any subsequent breach.\nChanges to These Terms of Service\nWe reserve the right, at Our sole discretion, to modify or replace these Terms at any time. If a revision is\nmaterial We will make reasonable efforts to provide at least 30 days\' notice prior to any new terms taking\neffect. What constitutes a material change will be determined at Our sole discretion.\nBy continuing to access or use Our Service after those revisions become effective, You agree to be bound\nby the revised terms. If You do not agree to the new terms, in whole or in part, please stop using the\nwebsite and the Service.\nContact Us\nIf you have any questions about these Terms of Service, You can contact us:\n● By visiting this page on our website: [WEBSITE_CONTACT_PAGE_URL]\n● By sending us an email: [WEBSITE_CONTACT_EMAIL]',
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            fontSize: 14.0,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 12.0, 24.0, 24.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.00, 0.05),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      Navigator.pop(context);
                                    },
                                    text: 'Close',
                                    options: FFButtonOptions(
                                      height: 44.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                      elevation: 0.0,
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ).animateOnPageLoad(
                    animationsMap['containerOnPageLoadAnimation']!),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
