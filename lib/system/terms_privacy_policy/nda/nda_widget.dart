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
import 'nda_model.dart';
export 'nda_model.dart';

class NdaWidget extends StatefulWidget {
  const NdaWidget({Key? key}) : super(key: key);

  @override
  _NdaWidgetState createState() => _NdaWidgetState();
}

class _NdaWidgetState extends State<NdaWidget> with TickerProviderStateMixin {
  late NdaModel _model;

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
    _model = createModel(context, () => NdaModel());

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
                              Icons.close_sharp,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 16.0, 0.0, 0.0),
                        child: Text(
                          'NON-DISCLOSURE AGREEMENT',
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
                                      'KNOW ALL MEN BY THESE PRESENTS:\nThis Agreement entered into by and between:\nThe USER referred to as the “Disclosing Party”;\n-and-\nUSSC referred to as the “Receiving Party”.\n\nDisclosing Party may share certain proprietary and confidential information with the\nRecipient. Therefore, in consideration of the mutual promises and covenants contained in this\nAgreement, the receipt and sufficiency of which is hereby acknowledged, the parties hereto agree as\nfollows:\n1. Definition of Confidential Information\na) For purposes of this Agreement, “Confidential Information” means any data or\ninformation so defined under the Data Privacy Act of 2012 and its IRR that is\nproprietary to the Disclosing Party and not generally known to the public, whether in\ntangible and intangible form, whenever and however disclosed, including, but not\nlimited to:\n(1) any marketing strategies, plans, financial information, or projections,\noperations, sales estimates, business plans and performance results relating to\nthe past, present or future business activities of such party, its affiliates,\nsubsidiaries and affiliated and/or contracting agencies/ organizations/ LGUs/\ncompanies;\n(2) plans for products or services, and membership/healthcare\nprovider/supplier/contractor/accredited agents lists;\n\n(3) any scientific or technical information, invention, design, process, procedure,\nformula, improvement, technology or method;\n(4) any concepts, reports, data, know-how, works-in-progress, designs,\ndevelopment tools, specifications, computer software, source code, object code,\nflow charts, databases, inventions, information and trade secrets; and\n(5) any other information that should reasonably be recognized as proprietary or\nconfidential information of the Disclosing Party and/or of its\naffiliated/accredited/contracting entities. Confidential Information need not be\nnovel, unique, patentable, copyrightable or constitute a trade secret in order to\nbe designated Confidential Information. The Receiving Party acknowledges that\nthe Confidential Information is proprietary to the Disclosing Party, has been\ndeveloped and obtained through great efforts by the Disclosing Party and that\nDisclosing Party regards all of its Confidential Information as trade secrets.\nb) As defined in PhilHealth Office Order No. 0050, s-2011 regarding the PhilHealth\nPolicy on Confidentiality and Security of Protected Health Information, Confidential\nInformation shall include, but not limited to, protected health information, personal\nfinancial information, patient records, or information gained from committee\nmeetings, hospitals or facility visits during accreditation and investigation, inquiries\nfrom members, patients or other PhilHealth employees.\nc) Notwithstanding anything in the foregoing to the contrary, Confidential Information\nshall not include information which:\n(1) was known by the Receiving Party prior to receiving the Confidential Information\nfrom the Disclosing Party;\n(2) becomes rightfully known to the Receiving Party from a Third-Party source not\nknown by the Receiving Party to be under an obligation to Disclosing Party to\nmaintain confidentiality;\n(3) is or becomes publicly available through no fault or failure to act by the\nReceiving Party in breach of the Agreement;\n(4) is required to be disclosed in a judicial or administrative proceeding, or\notherwise requested or required to be disclosed by law or regulation, although\nthe requirements of paragraph 4 hereof shall apply prior to any disclosure being\nmade; and\n(5) or has been independently developed by employees, consultants or agents of\nthe Receiving Party without violation of the terms of this Agreement or\nreference or access to any Confidential Information.\n\n2. Disclosure of Confidential Information\nFrom time to time, the Disclosing Party may disclose Confidential Information to the\nReceiving Party. The Receiving Party will:\n(a) limit disclosure of any Confidential Information to its directors, officers, employees,\nagents or representatives (collectively “Representatives”) who have a need to know\nsuch Confidential Information in connection with the current or contemplated\ntransaction/relationship between the parties to which this Agreement relates, and only\nfor that purpose;\n(b) advise its Representatives of the proprietary nature of the Confidential Information and\nthe obligations set forth in this Agreement and require such Representatives to keep the\nConfidential Information confidential;\n(c) shall keep all Confidential Information strictly confidential by using a reasonable degree\nof care, but not less than the degree of care, used by it in safeguarding its own\nconfidential information;\n(d) not disclose any Confidential Information received by it to any third parties without the\nDisclosing Party’s consent or as otherwise provided for herein.\nEach party shall be responsible for any breach of this Agreement by any of their respective\nAgents and/or Representatives.\n3. Use of Confidential Information\nThe Receiving Party agrees to use the Confidential Information solely in connection with the\ncurrent or contemplated business relationship between the parties and not for any purpose\nother than as authorized by this Agreement. No other right or license, whether expressed or\nimplied, in the Confidential Information is granted to the Receiving Party hereunder. Title to\nthe Confidential Information will remain solely in the Disclosing Party. All use of Confidential\nInformation by the Receiving Party shall be for the benefit of the Disclosing Party and any\nmodifications and improvements thereof by the Receiving Party shall be the sole property of\nthe Disclosing Party.\n4. Compelled Disclosure of Confidential Information\nNotwithstanding anything in the foregoing to the contrary, the Receiving Party may disclose\nConfidential Information pursuant to any judicial or administrative order, subpoena,\ndiscovery request, regulatory request or similar method, provided that the Receiving Party\npromptly notifies, to the extent practicable, the Disclosing Party in writing of such demand\nfor disclosure so that the Disclosing Party, at its sole expense, may seek to make such\ndisclosure subject to a protective order or other appropriate remedy to preserve the\nconfidentiality of the Confidential Information; provided in the case of a broad regulatory\nrequest with respect to the Receiving Party’s business (not targeted at Disclosing Party), the\nReceiving Party may promptly comply with such request provided the Receiving Party give (if\npermitted by such regulator) the Disclosing Party prompt notice of such disclosure.\n\nThe Receiving Party agrees that it shall not oppose and shall cooperate with efforts, to the\nextent practicable, by the Disclosing Party with respect to any such request for a protective\norder or other relief. Notwithstanding the foregoing, if the Disclosing Party is unable to\nobtain or does not seek a protective order and the Receiving Party is legally requested or\nrequired to disclose such Confidential Information may be made without liability.\n5. Term\nThis agreement shall take effect on the date of signing and shall subsist despite termination\nof the principal contract covered by this agreement.\n6. Remedies\nBoth parties acknowledge that the Confidential Information to be disclosed hereunder is of a\nunique and valuable character, and that the damages caused by unauthorized dissemination\nof the Confidential Information would be impossible to calculate.\nTherefore, both parties hereby agree that the Disclosing Party shall be entitled to injunctive\nrelief preventing the dissemination of any Confidential Information in violation of the terms\nhereof. Such injunctive relief shall be in addition to any other remedies available hereunder\nwhether at law or in equity including damages. Disclosing Party shall be entitled to recover\nits costs and fees, including reasonable attorneys’ fees incurred in obtaining any such relief.\nFurther, in the event of litigation relating to this Agreement, the prevailing party shall be\nentitled to recover its reasonable attorney’s fees and expenses.\n7. Return of Confidential Information\nReceiving Party shall immediately return to the other all tangible material embodying the\nConfidential Information provided hereunder and all notes, summaries, memoranda,\ndrawings, manuals, records, excerpts or derivative information deriving there from and all\nother documents or materials (“Notes” and all copies of any of the foregoing including\n“copies” that have been converted to computerized media in the form of image, data or\nword processing files either manually or by image capture) based on or including any\nConfidential Information in whatever form of storage or retrieval, upon the:\n(a) completion or termination of the dealings between the parties contemplated\nhereunder;\n(b) the termination of this Agreement; or\n(c) at such time as the Disclosing Party may so request; provided however that the\nReceiving Party may retain such documents as is necessary to enable it to comply with\nits document retention policies. Alternatively, the Receiving Party, with the written\nconsent of the Disclosing Party may (or in case of Notes, at the Receiving Party’s option)\nimmediately destroy any of the foregoing embodying Confidential Information (or the\nreasonably non recoverable data erasure of computerized data) and, upon request,\ncertify in writing such destruction by an authorized officer of the Receiving Party\nsupervising the destruction.\n\n8. Safekeeping of Confidential Information\nReceiving Party shall use the same care to avoid disclosure or unauthorized use of the\nconfidential information as it uses to protect its own confidential information, but in no\nevent less than reasonable care. It is agreed that:\n(a) All confidential information shall be retained by the Receiving Party in a secure place\nwith access limited only to the Receiving Party’s employees or agents who need to\nknow such information for purposes of this Agreement, and\n(b) Confidential Information will be disclosed only to each party’s respective employees\nwho are involved in the Potential Transaction and to third party consultants or advisers\nwho have been engaged for the purpose of discussing the Potential Transaction, which\nthe Disclosing Party has prior notice of such engagement, provided that in the event of\nsuch disclosure to any third person or entity not employees or retained by the\nReceiving Party, the Receiving Party shall nonetheless remain liable for any\nunauthorized disclosure by such person or entity.\nIt is further agreed that the Receiving Party shall ensure that all of the employees and\nconsultants (including employees and consultants of its parent, subsidiaries and affiliates)\nhaving access to Confidential Information adhere to the terms and conditions of this\nAgreement as if they were parties hereto.\n9. No Gift Policy\nThe contracting parties undertake to comply with the Office Order No. 0018-2015 entitled\n“Reiteration of Philhealth No Gift Policy (Revision 1)” which is deemed incorporated into this\nContract. No Philhealth personnel shall solicit, demand or accept, directly or indirectly, any\ngift from any person, group, association, or juridical entity, whether from the public or\nprivate sector, at anytime, on or off the work premises where such gift is given in the course\nof official duties or in connection with any transaction which may affect the functions of\ntheir office or influence the actions of directors or employees, or create the appearance of a\nconflict of interest.\n10. Notice of Breach\nReceiving Party shall notify the Disclosing Party immediately upon discovery of any\nunauthorized use or disclosure of Confidential Information by Receiving Party or its\nRepresentatives, or any other breach of this Agreement by Receiving Party or its\nRepresentatives, and will cooperate with efforts by the Disclosing Party to help the\nDisclosing Party regain possession of Confidential Information and prevent its further\nunauthorized use.\n11. No Publicity\nNeither Party hereto shall in anyway or in any form disclose, publicize, or advertise in any\nmanner the discussions that gave rise to this Agreement nor the discussions or negotiations\ncovered by this agreement without prior written consent of the other Party.\n\n12. No Binding Agreement for Transaction\nThe parties agree that neither party will be under any legal obligation of any kind\nwhatsoever with respect to a Transaction by virtue of this Agreement, except for the\nmatters specifically agreed to herein. The parties further acknowledge and agree that they\neach reserve the right in their sole and absolute discretion, to reject any and all proposals\nand to terminate discussions and negotiations with respect to a Transaction at any time. This\nAgreement does not create a joint venture or partnership between the parties. If a\nTransaction goes forward, the non- disclosure provisions of any applicable transaction\ndocuments entered into between the parties (or their respective affiliates) for the\nTransaction shall supersede this Agreement. In the event such provision is not provided for\nin said transaction documents, this Agreement shall control.\nNO WARRANTIES ARE MADE BY EITHER PARTY UNDER THIS AGREEMENT WHATSOEVER.\nThe parties acknowledge that although they shall each endeavor to include in the\nConfidential Information all information that they each believe relevant for the purpose of\nthe evaluation of a Transaction, the parties understand that no representation or warranty\nas to the accuracy or completeness of the Confidential Information is being made by either\nparty as the Disclosing Party. Further, neither party is under any obligation under this\nAgreement to disclose any Confidential Information it chooses not to disclose. Neither Party\nhereto shall have any liability to the other party or to other party’s Representatives resulting\nfrom any use of the Confidential Information except with respect to disclosure of such\nConfidential Information in violation of this Agreement and the Data Privacy Act.\n13. Miscellaneous Provisions\n(a) This Agreement constitutes the entire understanding between the parties and\nsupersedes any and all prior or contemporaneous understandings and agreements,\nwhether oral or written, between the parties, with respect to the subject matter hereof.\nThis Agreement can only be modified by a written amendment signed by the party\nagainst whom enforcement of such modification is sought.\n(b) Any failure by either party to enforce the other party’s strict performance of any\nprovision of this Agreement will not constitute a waiver of its right to subsequently\nenforce such provision or any other provision of this Agreement.\n(c) Although the restriction contained in this Agreement are considered by the parties to be\nreasonable for the purpose of protecting the Confidential Information, if any such\nrestriction is found by a court of competent jurisdiction to be unenforceable, such\nprovision will be modified, rewritten or interpreted to include as much of its nature and\nscope as will render enforceable. If it cannot be so modified, rewritten or interpreted to\nbe enforceable in any respect, it will not be given effect, and the remainder of the\nAgreement will be enforced as if such provision was not included.\n(d) This Agreement is personal in nature, and neither party may directly or indirectly assign\nor transfer it by operation of law or otherwise without the prior written consent of the\nother party. All obligations contained in this Agreement shall extend to and be binding\nupon the parties to this Agreement and their respective successors, assigns and\ndesignees.\n\n14. Notices\nAny notice or communication required or permitted to be given by this Agreement or given\nin connection with it, shall be in writing and shall be given to the appropriate party by\npersonal delivery or by registered mail, postage prepaid, or recognized reputable private\ncourier, in each case, to the address of the other party first indicated above (or such other\naddress as may be furnished by a party in accordance with this paragraph).\nAll such notices or communications shall be deemed to have been given and received as\nfollows:\n(a) In case of personal delivery and recognized reputable private courier, on the date of\nreceipt by Receiving Party of such delivery.\n(b) In case of registered mail, on the day of mailing.\n',
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
                                    text: 'Cancel',
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
                                Align(
                                  alignment: AlignmentDirectional(0.00, 0.05),
                                  child: FFButtonWidget(
                                    onPressed: () {
                                      print('Button pressed ...');
                                    },
                                    text: 'ACCEPT',
                                    options: FFButtonOptions(
                                      height: 44.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: Color(0x4C40EF39),
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall,
                                      elevation: 3.0,
                                      borderSide: BorderSide(
                                        width: 1.0,
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
