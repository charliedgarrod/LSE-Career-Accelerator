# NHS Missed Appointments & Resource Utilisation Analysis

This project investigates the challenges of missed appointments and resource strain within the NHS, identifying operational inefficiencies and surfacing data-driven strategies to optimise human capital deployment.

📌 **Problem Statement**
Missed appointments cost the NHS an estimated £216 million in 2019 alone, highlighting serious inefficiencies in patient engagement and workforce allocation. This project addresses two critical questions:
- Does the NHS have sufficient human capital?
- Are existing resources being allocated efficiently?

🧠 **Analytical Approach**
A comprehensive multi-step analysis using Excel was employed to wrangle, clean, and visualise healthcare appointment data across multiple NHS regions and time periods.
***Key Steps:***
- Data cleaning: Removed 21,000+ duplicate records; merged regional codes.
- Exploratory data analysis: Investigated patterns in service settings, healthcare professional types, appointment modes, wait times, and attendance.
- Time series and capacity modelling: Examined seasonal and regional trends.
- Social sentiment scan: Used hashtag analysis to explore recruitment interest and tech adoption themes.

📊 **Key Insights**
- ***Appointment Mode Efficiency:***
Face-to-face (59%) and telephone (36%) dominate. However, telephone appointments have 96%+ consistent attendance, outperforming face-to-face in reliability.
- ***Wait Time Impact:***
Same-day bookings achieve the highest attendance. Appointments with waits beyond 2–14 days are least likely to be attended—particularly face-to-face ones.
- ***Daily/Weekly Trends:***
Mondays see peak appointment demand post-weekend closure. Spikes and dips align with public holidays and Covid restrictions.
- ***Covid’s Operational Shock:***
Appointment volume dropped sharply during 2020 lockdowns, revealing underutilised capacity followed by significant strain post-restrictions.
- ***Regional Utilisation Disparity:***
Regions like London and Midlands show more intense demand than others, spotlighting an imbalance in resource allocation.

🧭 **Recommendations**
- ***Minimise Wait Times for In-Person Appointments:***
Convert longer-wait face-to-face appointments to telephone or online formats after 2 days to reduce DNAs (Did Not Attends).
- ***Expand Telehealth Services:***
Leverage consistently high telephone attendance by formalising a national "tele-first" strategy.
- ***Rebalance Staff Across Regions:***
Allocate healthcare workers based on observed utilisation rates to address overburdened regions.
- ***Smooth Monday Demand Spikes:***
Introduce weekend or staggered appointments, or increase Monday staffing to handle surges.
- ***Tap into Tech & Recruitment Trends:***
Hashtag analysis reveals strong public interest in AI and digital healthcare—use this to modernise service delivery and enhance recruitment efforts.

🛠️ **Tools & Techniques**
- Tools: Python, Jupyter Notebooks
- Skills demonstrated: Data wrangling, exploratory analysis, time series interpretation, visualisation, and business decision support.

📌 **Notes for Future Analysis**
- Consider longitudinal analysis with post-Covid data for comparison.
- Break down “Other Practice Staff” into specific roles to clarify workforce allocation.
- Link with Integrated Care Board data for micro-regional planning.

