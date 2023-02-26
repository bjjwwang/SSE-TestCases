; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__wchar_t_declare_loop_45-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__wchar_t_declare_loop_45-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@CWE126_Buffer_Overread__wchar_t_declare_loop_45_badData = internal global i32* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE126_Buffer_Overread__wchar_t_declare_loop_45_goodG2BData = internal global i32* null, align 8, !dbg !7

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__wchar_t_declare_loop_45_bad() #0 !dbg !23 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !27, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !29, metadata !DIExpression()), !dbg !33
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !34, metadata !DIExpression()), !dbg !38
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !39
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 65, i64 noundef 49), !dbg !40
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !41
  store i32 0, i32* %arrayidx, align 4, !dbg !42
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !43
  %call2 = call i32* @wmemset(i32* noundef %arraydecay1, i32 noundef 65, i64 noundef 99), !dbg !44
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !45
  store i32 0, i32* %arrayidx3, align 4, !dbg !46
  %arraydecay4 = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !47
  store i32* %arraydecay4, i32** %data, align 8, !dbg !48
  %0 = load i32*, i32** %data, align 8, !dbg !49
  store i32* %0, i32** @CWE126_Buffer_Overread__wchar_t_declare_loop_45_badData, align 8, !dbg !50
  call void @badSink(), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__wchar_t_declare_loop_45_good() #0 !dbg !53 {
entry:
  call void @goodG2B(), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !56 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !62, metadata !DIExpression()), !dbg !63
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !64, metadata !DIExpression()), !dbg !65
  %call = call i64 @time(i64* noundef null), !dbg !66
  %conv = trunc i64 %call to i32, !dbg !67
  call void @srand(i32 noundef %conv), !dbg !68
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !69
  call void @CWE126_Buffer_Overread__wchar_t_declare_loop_45_good(), !dbg !70
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !71
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !72
  call void @CWE126_Buffer_Overread__wchar_t_declare_loop_45_bad(), !dbg !73
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !74
  ret i32 0, !dbg !75
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @badSink() #0 !dbg !76 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !77, metadata !DIExpression()), !dbg !78
  %0 = load i32*, i32** @CWE126_Buffer_Overread__wchar_t_declare_loop_45_badData, align 8, !dbg !79
  store i32* %0, i32** %data, align 8, !dbg !78
  call void @llvm.dbg.declare(metadata i64* %i, metadata !80, metadata !DIExpression()), !dbg !86
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !87, metadata !DIExpression()), !dbg !88
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !89, metadata !DIExpression()), !dbg !90
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !91
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !92
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !93
  store i32 0, i32* %arrayidx, align 4, !dbg !94
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !95
  %call2 = call i64 @wcslen(i32* noundef %arraydecay1), !dbg !96
  store i64 %call2, i64* %destLen, align 8, !dbg !97
  store i64 0, i64* %i, align 8, !dbg !98
  br label %for.cond, !dbg !100

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !101
  %2 = load i64, i64* %destLen, align 8, !dbg !103
  %cmp = icmp ult i64 %1, %2, !dbg !104
  br i1 %cmp, label %for.body, label %for.end, !dbg !105

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %data, align 8, !dbg !106
  %4 = load i64, i64* %i, align 8, !dbg !108
  %arrayidx3 = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !106
  %5 = load i32, i32* %arrayidx3, align 4, !dbg !106
  %6 = load i64, i64* %i, align 8, !dbg !109
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %6, !dbg !110
  store i32 %5, i32* %arrayidx4, align 4, !dbg !111
  br label %for.inc, !dbg !112

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !113
  %inc = add i64 %7, 1, !dbg !113
  store i64 %inc, i64* %i, align 8, !dbg !113
  br label %for.cond, !dbg !114, !llvm.loop !115

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !118
  store i32 0, i32* %arrayidx5, align 4, !dbg !119
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !120
  call void @printWLine(i32* noundef %arraydecay6), !dbg !121
  ret void, !dbg !122
}

declare i64 @wcslen(i32* noundef) #2

declare void @printWLine(i32* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !123 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !124, metadata !DIExpression()), !dbg !125
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !126, metadata !DIExpression()), !dbg !127
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !128, metadata !DIExpression()), !dbg !129
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !130
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 65, i64 noundef 49), !dbg !131
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !132
  store i32 0, i32* %arrayidx, align 4, !dbg !133
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !134
  %call2 = call i32* @wmemset(i32* noundef %arraydecay1, i32 noundef 65, i64 noundef 99), !dbg !135
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !136
  store i32 0, i32* %arrayidx3, align 4, !dbg !137
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !138
  store i32* %arraydecay4, i32** %data, align 8, !dbg !139
  %0 = load i32*, i32** %data, align 8, !dbg !140
  store i32* %0, i32** @CWE126_Buffer_Overread__wchar_t_declare_loop_45_goodG2BData, align 8, !dbg !141
  call void @goodG2BSink(), !dbg !142
  ret void, !dbg !143
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2BSink() #0 !dbg !144 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !145, metadata !DIExpression()), !dbg !146
  %0 = load i32*, i32** @CWE126_Buffer_Overread__wchar_t_declare_loop_45_goodG2BData, align 8, !dbg !147
  store i32* %0, i32** %data, align 8, !dbg !146
  call void @llvm.dbg.declare(metadata i64* %i, metadata !148, metadata !DIExpression()), !dbg !150
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !151, metadata !DIExpression()), !dbg !152
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !153, metadata !DIExpression()), !dbg !154
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !155
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !156
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !157
  store i32 0, i32* %arrayidx, align 4, !dbg !158
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !159
  %call2 = call i64 @wcslen(i32* noundef %arraydecay1), !dbg !160
  store i64 %call2, i64* %destLen, align 8, !dbg !161
  store i64 0, i64* %i, align 8, !dbg !162
  br label %for.cond, !dbg !164

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !165
  %2 = load i64, i64* %destLen, align 8, !dbg !167
  %cmp = icmp ult i64 %1, %2, !dbg !168
  br i1 %cmp, label %for.body, label %for.end, !dbg !169

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %data, align 8, !dbg !170
  %4 = load i64, i64* %i, align 8, !dbg !172
  %arrayidx3 = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !170
  %5 = load i32, i32* %arrayidx3, align 4, !dbg !170
  %6 = load i64, i64* %i, align 8, !dbg !173
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %6, !dbg !174
  store i32 %5, i32* %arrayidx4, align 4, !dbg !175
  br label %for.inc, !dbg !176

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !177
  %inc = add i64 %7, 1, !dbg !177
  store i64 %inc, i64* %i, align 8, !dbg !177
  br label %for.cond, !dbg !178, !llvm.loop !179

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !181
  store i32 0, i32* %arrayidx5, align 4, !dbg !182
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !183
  call void @printWLine(i32* noundef %arraydecay6), !dbg !184
  ret void, !dbg !185
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!16, !17, !18, !19, !20, !21}
!llvm.ident = !{!22}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE126_Buffer_Overread__wchar_t_declare_loop_45_badData", scope: !2, file: !9, line: 21, type: !10, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !6, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__wchar_t_declare_loop_45-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5}
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !{!0, !7}
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(name: "CWE126_Buffer_Overread__wchar_t_declare_loop_45_goodG2BData", scope: !2, file: !9, line: 22, type: !10, isLocal: true, isDefinition: true)
!9 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__wchar_t_declare_loop_45-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!11 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !12, line: 34, baseType: !13)
!12 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_wchar_t.h", directory: "")
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wchar_t", file: !14, line: 106, baseType: !15)
!14 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!15 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!16 = !{i32 7, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{i32 7, !"PIC Level", i32 2}
!20 = !{i32 7, !"uwtable", i32 1}
!21 = !{i32 7, !"frame-pointer", i32 2}
!22 = !{!"Homebrew clang version 14.0.6"}
!23 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_loop_45_bad", scope: !9, file: !9, line: 46, type: !24, scopeLine: 47, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !26)
!24 = !DISubroutineType(types: !25)
!25 = !{null}
!26 = !{}
!27 = !DILocalVariable(name: "data", scope: !23, file: !9, line: 48, type: !10)
!28 = !DILocation(line: 48, column: 15, scope: !23)
!29 = !DILocalVariable(name: "dataBadBuffer", scope: !23, file: !9, line: 49, type: !30)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 1600, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 50)
!33 = !DILocation(line: 49, column: 13, scope: !23)
!34 = !DILocalVariable(name: "dataGoodBuffer", scope: !23, file: !9, line: 50, type: !35)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 3200, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 100)
!38 = !DILocation(line: 50, column: 13, scope: !23)
!39 = !DILocation(line: 51, column: 13, scope: !23)
!40 = !DILocation(line: 51, column: 5, scope: !23)
!41 = !DILocation(line: 52, column: 5, scope: !23)
!42 = !DILocation(line: 52, column: 25, scope: !23)
!43 = !DILocation(line: 53, column: 13, scope: !23)
!44 = !DILocation(line: 53, column: 5, scope: !23)
!45 = !DILocation(line: 54, column: 5, scope: !23)
!46 = !DILocation(line: 54, column: 27, scope: !23)
!47 = !DILocation(line: 56, column: 12, scope: !23)
!48 = !DILocation(line: 56, column: 10, scope: !23)
!49 = !DILocation(line: 57, column: 63, scope: !23)
!50 = !DILocation(line: 57, column: 61, scope: !23)
!51 = !DILocation(line: 58, column: 5, scope: !23)
!52 = !DILocation(line: 59, column: 1, scope: !23)
!53 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_loop_45_good", scope: !9, file: !9, line: 101, type: !24, scopeLine: 102, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !26)
!54 = !DILocation(line: 103, column: 5, scope: !53)
!55 = !DILocation(line: 104, column: 1, scope: !53)
!56 = distinct !DISubprogram(name: "main", scope: !9, file: !9, line: 115, type: !57, scopeLine: 116, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !26)
!57 = !DISubroutineType(types: !58)
!58 = !{!15, !15, !59}
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 64)
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!61 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!62 = !DILocalVariable(name: "argc", arg: 1, scope: !56, file: !9, line: 115, type: !15)
!63 = !DILocation(line: 115, column: 14, scope: !56)
!64 = !DILocalVariable(name: "argv", arg: 2, scope: !56, file: !9, line: 115, type: !59)
!65 = !DILocation(line: 115, column: 27, scope: !56)
!66 = !DILocation(line: 118, column: 22, scope: !56)
!67 = !DILocation(line: 118, column: 12, scope: !56)
!68 = !DILocation(line: 118, column: 5, scope: !56)
!69 = !DILocation(line: 120, column: 5, scope: !56)
!70 = !DILocation(line: 121, column: 5, scope: !56)
!71 = !DILocation(line: 122, column: 5, scope: !56)
!72 = !DILocation(line: 125, column: 5, scope: !56)
!73 = !DILocation(line: 126, column: 5, scope: !56)
!74 = !DILocation(line: 127, column: 5, scope: !56)
!75 = !DILocation(line: 129, column: 5, scope: !56)
!76 = distinct !DISubprogram(name: "badSink", scope: !9, file: !9, line: 26, type: !24, scopeLine: 27, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !26)
!77 = !DILocalVariable(name: "data", scope: !76, file: !9, line: 28, type: !10)
!78 = !DILocation(line: 28, column: 15, scope: !76)
!79 = !DILocation(line: 28, column: 22, scope: !76)
!80 = !DILocalVariable(name: "i", scope: !81, file: !9, line: 30, type: !82)
!81 = distinct !DILexicalBlock(scope: !76, file: !9, line: 29, column: 5)
!82 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !83, line: 31, baseType: !84)
!83 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!84 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !14, line: 94, baseType: !85)
!85 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!86 = !DILocation(line: 30, column: 16, scope: !81)
!87 = !DILocalVariable(name: "destLen", scope: !81, file: !9, line: 30, type: !82)
!88 = !DILocation(line: 30, column: 19, scope: !81)
!89 = !DILocalVariable(name: "dest", scope: !81, file: !9, line: 31, type: !35)
!90 = !DILocation(line: 31, column: 17, scope: !81)
!91 = !DILocation(line: 32, column: 17, scope: !81)
!92 = !DILocation(line: 32, column: 9, scope: !81)
!93 = !DILocation(line: 33, column: 9, scope: !81)
!94 = !DILocation(line: 33, column: 21, scope: !81)
!95 = !DILocation(line: 34, column: 26, scope: !81)
!96 = !DILocation(line: 34, column: 19, scope: !81)
!97 = !DILocation(line: 34, column: 17, scope: !81)
!98 = !DILocation(line: 37, column: 16, scope: !99)
!99 = distinct !DILexicalBlock(scope: !81, file: !9, line: 37, column: 9)
!100 = !DILocation(line: 37, column: 14, scope: !99)
!101 = !DILocation(line: 37, column: 21, scope: !102)
!102 = distinct !DILexicalBlock(scope: !99, file: !9, line: 37, column: 9)
!103 = !DILocation(line: 37, column: 25, scope: !102)
!104 = !DILocation(line: 37, column: 23, scope: !102)
!105 = !DILocation(line: 37, column: 9, scope: !99)
!106 = !DILocation(line: 39, column: 23, scope: !107)
!107 = distinct !DILexicalBlock(scope: !102, file: !9, line: 38, column: 9)
!108 = !DILocation(line: 39, column: 28, scope: !107)
!109 = !DILocation(line: 39, column: 18, scope: !107)
!110 = !DILocation(line: 39, column: 13, scope: !107)
!111 = !DILocation(line: 39, column: 21, scope: !107)
!112 = !DILocation(line: 40, column: 9, scope: !107)
!113 = !DILocation(line: 37, column: 35, scope: !102)
!114 = !DILocation(line: 37, column: 9, scope: !102)
!115 = distinct !{!115, !105, !116, !117}
!116 = !DILocation(line: 40, column: 9, scope: !99)
!117 = !{!"llvm.loop.mustprogress"}
!118 = !DILocation(line: 41, column: 9, scope: !81)
!119 = !DILocation(line: 41, column: 21, scope: !81)
!120 = !DILocation(line: 42, column: 20, scope: !81)
!121 = !DILocation(line: 42, column: 9, scope: !81)
!122 = !DILocation(line: 44, column: 1, scope: !76)
!123 = distinct !DISubprogram(name: "goodG2B", scope: !9, file: !9, line: 86, type: !24, scopeLine: 87, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !26)
!124 = !DILocalVariable(name: "data", scope: !123, file: !9, line: 88, type: !10)
!125 = !DILocation(line: 88, column: 15, scope: !123)
!126 = !DILocalVariable(name: "dataBadBuffer", scope: !123, file: !9, line: 89, type: !30)
!127 = !DILocation(line: 89, column: 13, scope: !123)
!128 = !DILocalVariable(name: "dataGoodBuffer", scope: !123, file: !9, line: 90, type: !35)
!129 = !DILocation(line: 90, column: 13, scope: !123)
!130 = !DILocation(line: 91, column: 13, scope: !123)
!131 = !DILocation(line: 91, column: 5, scope: !123)
!132 = !DILocation(line: 92, column: 5, scope: !123)
!133 = !DILocation(line: 92, column: 25, scope: !123)
!134 = !DILocation(line: 93, column: 13, scope: !123)
!135 = !DILocation(line: 93, column: 5, scope: !123)
!136 = !DILocation(line: 94, column: 5, scope: !123)
!137 = !DILocation(line: 94, column: 27, scope: !123)
!138 = !DILocation(line: 96, column: 12, scope: !123)
!139 = !DILocation(line: 96, column: 10, scope: !123)
!140 = !DILocation(line: 97, column: 67, scope: !123)
!141 = !DILocation(line: 97, column: 65, scope: !123)
!142 = !DILocation(line: 98, column: 5, scope: !123)
!143 = !DILocation(line: 99, column: 1, scope: !123)
!144 = distinct !DISubprogram(name: "goodG2BSink", scope: !9, file: !9, line: 66, type: !24, scopeLine: 67, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !26)
!145 = !DILocalVariable(name: "data", scope: !144, file: !9, line: 68, type: !10)
!146 = !DILocation(line: 68, column: 15, scope: !144)
!147 = !DILocation(line: 68, column: 22, scope: !144)
!148 = !DILocalVariable(name: "i", scope: !149, file: !9, line: 70, type: !82)
!149 = distinct !DILexicalBlock(scope: !144, file: !9, line: 69, column: 5)
!150 = !DILocation(line: 70, column: 16, scope: !149)
!151 = !DILocalVariable(name: "destLen", scope: !149, file: !9, line: 70, type: !82)
!152 = !DILocation(line: 70, column: 19, scope: !149)
!153 = !DILocalVariable(name: "dest", scope: !149, file: !9, line: 71, type: !35)
!154 = !DILocation(line: 71, column: 17, scope: !149)
!155 = !DILocation(line: 72, column: 17, scope: !149)
!156 = !DILocation(line: 72, column: 9, scope: !149)
!157 = !DILocation(line: 73, column: 9, scope: !149)
!158 = !DILocation(line: 73, column: 21, scope: !149)
!159 = !DILocation(line: 74, column: 26, scope: !149)
!160 = !DILocation(line: 74, column: 19, scope: !149)
!161 = !DILocation(line: 74, column: 17, scope: !149)
!162 = !DILocation(line: 77, column: 16, scope: !163)
!163 = distinct !DILexicalBlock(scope: !149, file: !9, line: 77, column: 9)
!164 = !DILocation(line: 77, column: 14, scope: !163)
!165 = !DILocation(line: 77, column: 21, scope: !166)
!166 = distinct !DILexicalBlock(scope: !163, file: !9, line: 77, column: 9)
!167 = !DILocation(line: 77, column: 25, scope: !166)
!168 = !DILocation(line: 77, column: 23, scope: !166)
!169 = !DILocation(line: 77, column: 9, scope: !163)
!170 = !DILocation(line: 79, column: 23, scope: !171)
!171 = distinct !DILexicalBlock(scope: !166, file: !9, line: 78, column: 9)
!172 = !DILocation(line: 79, column: 28, scope: !171)
!173 = !DILocation(line: 79, column: 18, scope: !171)
!174 = !DILocation(line: 79, column: 13, scope: !171)
!175 = !DILocation(line: 79, column: 21, scope: !171)
!176 = !DILocation(line: 80, column: 9, scope: !171)
!177 = !DILocation(line: 77, column: 35, scope: !166)
!178 = !DILocation(line: 77, column: 9, scope: !166)
!179 = distinct !{!179, !169, !180, !117}
!180 = !DILocation(line: 80, column: 9, scope: !163)
!181 = !DILocation(line: 81, column: 9, scope: !149)
!182 = !DILocation(line: 81, column: 21, scope: !149)
!183 = !DILocation(line: 82, column: 20, scope: !149)
!184 = !DILocation(line: 82, column: 9, scope: !149)
!185 = !DILocation(line: 84, column: 1, scope: !144)
