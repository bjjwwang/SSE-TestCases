; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__char_declare_memcpy_05-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__char_declare_memcpy_05-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !7
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__char_declare_memcpy_05_bad() #0 !dbg !18 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !22, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !31, metadata !DIExpression()), !dbg !35
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !36
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 49, i1 false), !dbg !36
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 49, !dbg !37
  store i8 0, i8* %arrayidx, align 1, !dbg !38
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !39
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 65, i64 99, i1 false), !dbg !39
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 99, !dbg !40
  store i8 0, i8* %arrayidx2, align 1, !dbg !41
  %0 = load i32, i32* @staticTrue, align 4, !dbg !42
  %tobool = icmp ne i32 %0, 0, !dbg !42
  br i1 %tobool, label %if.then, label %if.end, !dbg !44

if.then:                                          ; preds = %entry
  %arraydecay3 = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !45
  store i8* %arraydecay3, i8** %data, align 8, !dbg !47
  br label %if.end, !dbg !48

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !49, metadata !DIExpression()), !dbg !51
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !52
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay4, i8 67, i64 99, i1 false), !dbg !52
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !53
  store i8 0, i8* %arrayidx5, align 1, !dbg !54
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !55
  %1 = load i8*, i8** %data, align 8, !dbg !55
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !55
  %call = call i64 @strlen(i8* noundef %arraydecay7), !dbg !55
  %mul = mul i64 %call, 1, !dbg !55
  %call8 = call i8* @__memcpy_chk(i8* noundef %arraydecay6, i8* noundef %1, i64 noundef %mul, i64 noundef 100) #5, !dbg !55
  %arrayidx9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !56
  store i8 0, i8* %arrayidx9, align 1, !dbg !57
  %arraydecay10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !58
  call void @printLine(i8* noundef %arraydecay10), !dbg !59
  ret void, !dbg !60
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare i8* @__memcpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #3

declare i64 @strlen(i8* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__char_declare_memcpy_05_good() #0 !dbg !61 {
entry:
  call void @goodG2B1(), !dbg !62
  call void @goodG2B2(), !dbg !63
  ret void, !dbg !64
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !65 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !69, metadata !DIExpression()), !dbg !70
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !71, metadata !DIExpression()), !dbg !72
  %call = call i64 @time(i64* noundef null), !dbg !73
  %conv = trunc i64 %call to i32, !dbg !74
  call void @srand(i32 noundef %conv), !dbg !75
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !76
  call void @CWE126_Buffer_Overread__char_declare_memcpy_05_good(), !dbg !77
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !78
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !79
  call void @CWE126_Buffer_Overread__char_declare_memcpy_05_bad(), !dbg !80
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !81
  ret i32 0, !dbg !82
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !83 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !84, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !86, metadata !DIExpression()), !dbg !87
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !88, metadata !DIExpression()), !dbg !89
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !90
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 49, i1 false), !dbg !90
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 49, !dbg !91
  store i8 0, i8* %arrayidx, align 1, !dbg !92
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !93
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 65, i64 99, i1 false), !dbg !93
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 99, !dbg !94
  store i8 0, i8* %arrayidx2, align 1, !dbg !95
  %0 = load i32, i32* @staticFalse, align 4, !dbg !96
  %tobool = icmp ne i32 %0, 0, !dbg !96
  br i1 %tobool, label %if.then, label %if.else, !dbg !98

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !99
  br label %if.end, !dbg !101

if.else:                                          ; preds = %entry
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !102
  store i8* %arraydecay3, i8** %data, align 8, !dbg !104
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !105, metadata !DIExpression()), !dbg !107
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !108
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay4, i8 67, i64 99, i1 false), !dbg !108
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !109
  store i8 0, i8* %arrayidx5, align 1, !dbg !110
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !111
  %1 = load i8*, i8** %data, align 8, !dbg !111
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !111
  %call = call i64 @strlen(i8* noundef %arraydecay7), !dbg !111
  %mul = mul i64 %call, 1, !dbg !111
  %call8 = call i8* @__memcpy_chk(i8* noundef %arraydecay6, i8* noundef %1, i64 noundef %mul, i64 noundef 100) #5, !dbg !111
  %arrayidx9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !112
  store i8 0, i8* %arrayidx9, align 1, !dbg !113
  %arraydecay10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !114
  call void @printLine(i8* noundef %arraydecay10), !dbg !115
  ret void, !dbg !116
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !117 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !118, metadata !DIExpression()), !dbg !119
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !120, metadata !DIExpression()), !dbg !121
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !122, metadata !DIExpression()), !dbg !123
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !124
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 49, i1 false), !dbg !124
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 49, !dbg !125
  store i8 0, i8* %arrayidx, align 1, !dbg !126
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !127
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 65, i64 99, i1 false), !dbg !127
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 99, !dbg !128
  store i8 0, i8* %arrayidx2, align 1, !dbg !129
  %0 = load i32, i32* @staticTrue, align 4, !dbg !130
  %tobool = icmp ne i32 %0, 0, !dbg !130
  br i1 %tobool, label %if.then, label %if.end, !dbg !132

if.then:                                          ; preds = %entry
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !133
  store i8* %arraydecay3, i8** %data, align 8, !dbg !135
  br label %if.end, !dbg !136

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !137, metadata !DIExpression()), !dbg !139
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !140
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay4, i8 67, i64 99, i1 false), !dbg !140
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !141
  store i8 0, i8* %arrayidx5, align 1, !dbg !142
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !143
  %1 = load i8*, i8** %data, align 8, !dbg !143
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !143
  %call = call i64 @strlen(i8* noundef %arraydecay7), !dbg !143
  %mul = mul i64 %call, 1, !dbg !143
  %call8 = call i8* @__memcpy_chk(i8* noundef %arraydecay6, i8* noundef %1, i64 noundef %mul, i64 noundef 100) #5, !dbg !143
  %arrayidx9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !144
  store i8 0, i8* %arrayidx9, align 1, !dbg !145
  %arraydecay10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !146
  call void @printLine(i8* noundef %arraydecay10), !dbg !147
  ret void, !dbg !148
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!11, !12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !9, line: 25, type: !10, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !6, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__char_declare_memcpy_05-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5}
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !{!0, !7}
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !9, line: 26, type: !10, isLocal: true, isDefinition: true)
!9 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__char_declare_memcpy_05-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !{i32 7, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{i32 7, !"PIC Level", i32 2}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"Homebrew clang version 14.0.6"}
!18 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_declare_memcpy_05_bad", scope: !9, file: !9, line: 30, type: !19, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !21)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !{}
!22 = !DILocalVariable(name: "data", scope: !18, file: !9, line: 32, type: !23)
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64)
!24 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!25 = !DILocation(line: 32, column: 12, scope: !18)
!26 = !DILocalVariable(name: "dataBadBuffer", scope: !18, file: !9, line: 33, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !24, size: 400, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 50)
!30 = !DILocation(line: 33, column: 10, scope: !18)
!31 = !DILocalVariable(name: "dataGoodBuffer", scope: !18, file: !9, line: 34, type: !32)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !24, size: 800, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 100)
!35 = !DILocation(line: 34, column: 10, scope: !18)
!36 = !DILocation(line: 35, column: 5, scope: !18)
!37 = !DILocation(line: 36, column: 5, scope: !18)
!38 = !DILocation(line: 36, column: 25, scope: !18)
!39 = !DILocation(line: 37, column: 5, scope: !18)
!40 = !DILocation(line: 38, column: 5, scope: !18)
!41 = !DILocation(line: 38, column: 27, scope: !18)
!42 = !DILocation(line: 39, column: 8, scope: !43)
!43 = distinct !DILexicalBlock(scope: !18, file: !9, line: 39, column: 8)
!44 = !DILocation(line: 39, column: 8, scope: !18)
!45 = !DILocation(line: 42, column: 16, scope: !46)
!46 = distinct !DILexicalBlock(scope: !43, file: !9, line: 40, column: 5)
!47 = !DILocation(line: 42, column: 14, scope: !46)
!48 = !DILocation(line: 43, column: 5, scope: !46)
!49 = !DILocalVariable(name: "dest", scope: !50, file: !9, line: 45, type: !32)
!50 = distinct !DILexicalBlock(scope: !18, file: !9, line: 44, column: 5)
!51 = !DILocation(line: 45, column: 14, scope: !50)
!52 = !DILocation(line: 46, column: 9, scope: !50)
!53 = !DILocation(line: 47, column: 9, scope: !50)
!54 = !DILocation(line: 47, column: 21, scope: !50)
!55 = !DILocation(line: 50, column: 9, scope: !50)
!56 = !DILocation(line: 51, column: 9, scope: !50)
!57 = !DILocation(line: 51, column: 21, scope: !50)
!58 = !DILocation(line: 52, column: 19, scope: !50)
!59 = !DILocation(line: 52, column: 9, scope: !50)
!60 = !DILocation(line: 54, column: 1, scope: !18)
!61 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_declare_memcpy_05_good", scope: !9, file: !9, line: 119, type: !19, scopeLine: 120, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !21)
!62 = !DILocation(line: 121, column: 5, scope: !61)
!63 = !DILocation(line: 122, column: 5, scope: !61)
!64 = !DILocation(line: 123, column: 1, scope: !61)
!65 = distinct !DISubprogram(name: "main", scope: !9, file: !9, line: 135, type: !66, scopeLine: 136, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !21)
!66 = !DISubroutineType(types: !67)
!67 = !{!10, !10, !68}
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!69 = !DILocalVariable(name: "argc", arg: 1, scope: !65, file: !9, line: 135, type: !10)
!70 = !DILocation(line: 135, column: 14, scope: !65)
!71 = !DILocalVariable(name: "argv", arg: 2, scope: !65, file: !9, line: 135, type: !68)
!72 = !DILocation(line: 135, column: 27, scope: !65)
!73 = !DILocation(line: 138, column: 22, scope: !65)
!74 = !DILocation(line: 138, column: 12, scope: !65)
!75 = !DILocation(line: 138, column: 5, scope: !65)
!76 = !DILocation(line: 140, column: 5, scope: !65)
!77 = !DILocation(line: 141, column: 5, scope: !65)
!78 = !DILocation(line: 142, column: 5, scope: !65)
!79 = !DILocation(line: 145, column: 5, scope: !65)
!80 = !DILocation(line: 146, column: 5, scope: !65)
!81 = !DILocation(line: 147, column: 5, scope: !65)
!82 = !DILocation(line: 149, column: 5, scope: !65)
!83 = distinct !DISubprogram(name: "goodG2B1", scope: !9, file: !9, line: 61, type: !19, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !21)
!84 = !DILocalVariable(name: "data", scope: !83, file: !9, line: 63, type: !23)
!85 = !DILocation(line: 63, column: 12, scope: !83)
!86 = !DILocalVariable(name: "dataBadBuffer", scope: !83, file: !9, line: 64, type: !27)
!87 = !DILocation(line: 64, column: 10, scope: !83)
!88 = !DILocalVariable(name: "dataGoodBuffer", scope: !83, file: !9, line: 65, type: !32)
!89 = !DILocation(line: 65, column: 10, scope: !83)
!90 = !DILocation(line: 66, column: 5, scope: !83)
!91 = !DILocation(line: 67, column: 5, scope: !83)
!92 = !DILocation(line: 67, column: 25, scope: !83)
!93 = !DILocation(line: 68, column: 5, scope: !83)
!94 = !DILocation(line: 69, column: 5, scope: !83)
!95 = !DILocation(line: 69, column: 27, scope: !83)
!96 = !DILocation(line: 70, column: 8, scope: !97)
!97 = distinct !DILexicalBlock(scope: !83, file: !9, line: 70, column: 8)
!98 = !DILocation(line: 70, column: 8, scope: !83)
!99 = !DILocation(line: 73, column: 9, scope: !100)
!100 = distinct !DILexicalBlock(scope: !97, file: !9, line: 71, column: 5)
!101 = !DILocation(line: 74, column: 5, scope: !100)
!102 = !DILocation(line: 78, column: 16, scope: !103)
!103 = distinct !DILexicalBlock(scope: !97, file: !9, line: 76, column: 5)
!104 = !DILocation(line: 78, column: 14, scope: !103)
!105 = !DILocalVariable(name: "dest", scope: !106, file: !9, line: 81, type: !32)
!106 = distinct !DILexicalBlock(scope: !83, file: !9, line: 80, column: 5)
!107 = !DILocation(line: 81, column: 14, scope: !106)
!108 = !DILocation(line: 82, column: 9, scope: !106)
!109 = !DILocation(line: 83, column: 9, scope: !106)
!110 = !DILocation(line: 83, column: 21, scope: !106)
!111 = !DILocation(line: 86, column: 9, scope: !106)
!112 = !DILocation(line: 87, column: 9, scope: !106)
!113 = !DILocation(line: 87, column: 21, scope: !106)
!114 = !DILocation(line: 88, column: 19, scope: !106)
!115 = !DILocation(line: 88, column: 9, scope: !106)
!116 = !DILocation(line: 90, column: 1, scope: !83)
!117 = distinct !DISubprogram(name: "goodG2B2", scope: !9, file: !9, line: 93, type: !19, scopeLine: 94, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !21)
!118 = !DILocalVariable(name: "data", scope: !117, file: !9, line: 95, type: !23)
!119 = !DILocation(line: 95, column: 12, scope: !117)
!120 = !DILocalVariable(name: "dataBadBuffer", scope: !117, file: !9, line: 96, type: !27)
!121 = !DILocation(line: 96, column: 10, scope: !117)
!122 = !DILocalVariable(name: "dataGoodBuffer", scope: !117, file: !9, line: 97, type: !32)
!123 = !DILocation(line: 97, column: 10, scope: !117)
!124 = !DILocation(line: 98, column: 5, scope: !117)
!125 = !DILocation(line: 99, column: 5, scope: !117)
!126 = !DILocation(line: 99, column: 25, scope: !117)
!127 = !DILocation(line: 100, column: 5, scope: !117)
!128 = !DILocation(line: 101, column: 5, scope: !117)
!129 = !DILocation(line: 101, column: 27, scope: !117)
!130 = !DILocation(line: 102, column: 8, scope: !131)
!131 = distinct !DILexicalBlock(scope: !117, file: !9, line: 102, column: 8)
!132 = !DILocation(line: 102, column: 8, scope: !117)
!133 = !DILocation(line: 105, column: 16, scope: !134)
!134 = distinct !DILexicalBlock(scope: !131, file: !9, line: 103, column: 5)
!135 = !DILocation(line: 105, column: 14, scope: !134)
!136 = !DILocation(line: 106, column: 5, scope: !134)
!137 = !DILocalVariable(name: "dest", scope: !138, file: !9, line: 108, type: !32)
!138 = distinct !DILexicalBlock(scope: !117, file: !9, line: 107, column: 5)
!139 = !DILocation(line: 108, column: 14, scope: !138)
!140 = !DILocation(line: 109, column: 9, scope: !138)
!141 = !DILocation(line: 110, column: 9, scope: !138)
!142 = !DILocation(line: 110, column: 21, scope: !138)
!143 = !DILocation(line: 113, column: 9, scope: !138)
!144 = !DILocation(line: 114, column: 9, scope: !138)
!145 = !DILocation(line: 114, column: 21, scope: !138)
!146 = !DILocation(line: 115, column: 19, scope: !138)
!147 = !DILocation(line: 115, column: 9, scope: !138)
!148 = !DILocation(line: 117, column: 1, scope: !117)
