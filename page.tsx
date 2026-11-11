export default function AdminPage(){return <main style={{maxWidth:900,margin:"70px auto",padding:24,color:"#f3f7f4",fontFamily:"Inter,Arial"}}>
 <a href="/" style={{color:"#b7f34a"}}>← Back to store</a><h1 style={{fontSize:42}}>STORE ADMIN</h1>
 <p style={{color:"#98a69d",lineHeight:1.7}}>The production admin panel will be connected to Supabase authentication and database after you add your project credentials. This starter intentionally does not expose an unauthenticated product editor.</p>
 <div style={{padding:22,background:"#111715",border:"1px solid #26332c",borderRadius:12}}>
 <h2>Admin setup checklist</h2><ol style={{lineHeight:2.1,color:"#cbd5ce"}}><li>Create your Supabase project.</li><li>Run the SQL schema in <code>supabase/schema.sql</code>.</li><li>Set your admin email in the environment variables.</li><li>Configure server-side admin authorization before enabling product uploads.</li><li>Connect private storage for ZIP files.</li></ol>
 </div></main>}
