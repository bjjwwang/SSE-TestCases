; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__char_declare_memcpy_17-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__char_declare_memcpy_17-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__char_declare_memcpy_17_bad() #0 !dbg !11 {
entry:
  %i = alloca i32, align 4
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i32* %i, metadata !16, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8** %data, metadata !19, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !23, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !28, metadata !DIExpression()), !dbg !32
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !33
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 49, i1 false), !dbg !33
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 49, !dbg !34
  store i8 0, i8* %arrayidx, align 1, !dbg !35
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !36
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 65, i64 99, i1 false), !dbg !36
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 99, !dbg !37
  store i8 0, i8* %arrayidx2, align 1, !dbg !38
  store i32 0, i32* %i, align 4, !dbg !39
  br label %for.cond, !dbg !41

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !42
  %cmp = icmp slt i32 %0, 1, !dbg !44
  br i1 %cmp, label %for.body, label %for.end, !dbg !45

for.body:                                         ; preds = %for.cond
  %arraydecay3 = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !46
  store i8* %arraydecay3, i8** %data, align 8, !dbg !48
  br label %for.inc, !dbg !49

for.inc:                                          ; preds = %for.body
  %1 = load i32, i32* %i, align 4, !dbg !50
  %inc = add nsw i32 %1, 1, !dbg !50
  store i32 %inc, i32* %i, align 4, !dbg !50
  br label %for.cond, !dbg !51, !llvm.loop !52

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !55, metadata !DIExpression()), !dbg !57
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !58
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay4, i8 67, i64 99, i1 false), !dbg !58
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !59
  store i8 0, i8* %arrayidx5, align 1, !dbg !60
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !61
  %2 = load i8*, i8** %data, align 8, !dbg !61
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !61
  %call = call i64 @strlen(i8* noundef %arraydecay7), !dbg !61
  %mul = mul i64 %call, 1, !dbg !61
  %call8 = call i8* @__memcpy_chk(i8* noundef %arraydecay6, i8* noundef %2, i64 noundef %mul, i64 noundef 100) #5, !dbg !61
  %arrayidx9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !62
  store i8 0, i8* %arrayidx9, align 1, !dbg !63
  %arraydecay10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !64
  call void @printLine(i8* noundef %arraydecay10), !dbg !65
  ret void, !dbg !66
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
define void @CWE126_Buffer_Overread__char_declare_memcpy_17_good() #0 !dbg !67 {
entry:
  call void @goodG2B(), !dbg !68
  ret void, !dbg !69
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !70 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !74, metadata !DIExpression()), !dbg !75
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !76, metadata !DIExpression()), !dbg !77
  %call = call i64 @time(i64* noundef null), !dbg !78
  %conv = trunc i64 %call to i32, !dbg !79
  call void @srand(i32 noundef %conv), !dbg !80
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !81
  call void @CWE126_Buffer_Overread__char_declare_memcpy_17_good(), !dbg !82
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !83
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !84
  call void @CWE126_Buffer_Overread__char_declare_memcpy_17_bad(), !dbg !85
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !86
  ret i32 0, !dbg !87
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !88 {
entry:
  %h = alloca i32, align 4
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i32* %h, metadata !89, metadata !DIExpression()), !dbg !90
  call void @llvm.dbg.declare(metadata i8** %data, metadata !91, metadata !DIExpression()), !dbg !92
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !93, metadata !DIExpression()), !dbg !94
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !95, metadata !DIExpression()), !dbg !96
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !97
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 49, i1 false), !dbg !97
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 49, !dbg !98
  store i8 0, i8* %arrayidx, align 1, !dbg !99
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !100
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 65, i64 99, i1 false), !dbg !100
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 99, !dbg !101
  store i8 0, i8* %arrayidx2, align 1, !dbg !102
  store i32 0, i32* %h, align 4, !dbg !103
  br label %for.cond, !dbg !105

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %h, align 4, !dbg !106
  %cmp = icmp slt i32 %0, 1, !dbg !108
  br i1 %cmp, label %for.body, label %for.end, !dbg !109

for.body:                                         ; preds = %for.cond
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !110
  store i8* %arraydecay3, i8** %data, align 8, !dbg !112
  br label %for.inc, !dbg !113

for.inc:                                          ; preds = %for.body
  %1 = load i32, i32* %h, align 4, !dbg !114
  %inc = add nsw i32 %1, 1, !dbg !114
  store i32 %inc, i32* %h, align 4, !dbg !114
  br label %for.cond, !dbg !115, !llvm.loop !116

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !118, metadata !DIExpression()), !dbg !120
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !121
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay4, i8 67, i64 99, i1 false), !dbg !121
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !122
  store i8 0, i8* %arrayidx5, align 1, !dbg !123
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !124
  %2 = load i8*, i8** %data, align 8, !dbg !124
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !124
  %call = call i64 @strlen(i8* noundef %arraydecay7), !dbg !124
  %mul = mul i64 %call, 1, !dbg !124
  %call8 = call i8* @__memcpy_chk(i8* noundef %arraydecay6, i8* noundef %2, i64 noundef %mul, i64 noundef 100) #5, !dbg !124
  %arrayidx9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !125
  store i8 0, i8* %arrayidx9, align 1, !dbg !126
  %arraydecay10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !127
  call void @printLine(i8* noundef %arraydecay10), !dbg !128
  ret void, !dbg !129
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__char_declare_memcpy_17-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_declare_memcpy_17_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__char_declare_memcpy_17-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "i", scope: !11, file: !12, line: 25, type: !17)
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocation(line: 25, column: 9, scope: !11)
!19 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 26, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!22 = !DILocation(line: 26, column: 12, scope: !11)
!23 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 27, type: !24)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 400, elements: !25)
!25 = !{!26}
!26 = !DISubrange(count: 50)
!27 = !DILocation(line: 27, column: 10, scope: !11)
!28 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 28, type: !29)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 800, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 100)
!32 = !DILocation(line: 28, column: 10, scope: !11)
!33 = !DILocation(line: 29, column: 5, scope: !11)
!34 = !DILocation(line: 30, column: 5, scope: !11)
!35 = !DILocation(line: 30, column: 25, scope: !11)
!36 = !DILocation(line: 31, column: 5, scope: !11)
!37 = !DILocation(line: 32, column: 5, scope: !11)
!38 = !DILocation(line: 32, column: 27, scope: !11)
!39 = !DILocation(line: 33, column: 11, scope: !40)
!40 = distinct !DILexicalBlock(scope: !11, file: !12, line: 33, column: 5)
!41 = !DILocation(line: 33, column: 9, scope: !40)
!42 = !DILocation(line: 33, column: 16, scope: !43)
!43 = distinct !DILexicalBlock(scope: !40, file: !12, line: 33, column: 5)
!44 = !DILocation(line: 33, column: 18, scope: !43)
!45 = !DILocation(line: 33, column: 5, scope: !40)
!46 = !DILocation(line: 36, column: 16, scope: !47)
!47 = distinct !DILexicalBlock(scope: !43, file: !12, line: 34, column: 5)
!48 = !DILocation(line: 36, column: 14, scope: !47)
!49 = !DILocation(line: 37, column: 5, scope: !47)
!50 = !DILocation(line: 33, column: 24, scope: !43)
!51 = !DILocation(line: 33, column: 5, scope: !43)
!52 = distinct !{!52, !45, !53, !54}
!53 = !DILocation(line: 37, column: 5, scope: !40)
!54 = !{!"llvm.loop.mustprogress"}
!55 = !DILocalVariable(name: "dest", scope: !56, file: !12, line: 39, type: !29)
!56 = distinct !DILexicalBlock(scope: !11, file: !12, line: 38, column: 5)
!57 = !DILocation(line: 39, column: 14, scope: !56)
!58 = !DILocation(line: 40, column: 9, scope: !56)
!59 = !DILocation(line: 41, column: 9, scope: !56)
!60 = !DILocation(line: 41, column: 21, scope: !56)
!61 = !DILocation(line: 44, column: 9, scope: !56)
!62 = !DILocation(line: 45, column: 9, scope: !56)
!63 = !DILocation(line: 45, column: 21, scope: !56)
!64 = !DILocation(line: 46, column: 19, scope: !56)
!65 = !DILocation(line: 46, column: 9, scope: !56)
!66 = !DILocation(line: 48, column: 1, scope: !11)
!67 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_declare_memcpy_17_good", scope: !12, file: !12, line: 82, type: !13, scopeLine: 83, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!68 = !DILocation(line: 84, column: 5, scope: !67)
!69 = !DILocation(line: 85, column: 1, scope: !67)
!70 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 97, type: !71, scopeLine: 98, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!71 = !DISubroutineType(types: !72)
!72 = !{!17, !17, !73}
!73 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!74 = !DILocalVariable(name: "argc", arg: 1, scope: !70, file: !12, line: 97, type: !17)
!75 = !DILocation(line: 97, column: 14, scope: !70)
!76 = !DILocalVariable(name: "argv", arg: 2, scope: !70, file: !12, line: 97, type: !73)
!77 = !DILocation(line: 97, column: 27, scope: !70)
!78 = !DILocation(line: 100, column: 22, scope: !70)
!79 = !DILocation(line: 100, column: 12, scope: !70)
!80 = !DILocation(line: 100, column: 5, scope: !70)
!81 = !DILocation(line: 102, column: 5, scope: !70)
!82 = !DILocation(line: 103, column: 5, scope: !70)
!83 = !DILocation(line: 104, column: 5, scope: !70)
!84 = !DILocation(line: 107, column: 5, scope: !70)
!85 = !DILocation(line: 108, column: 5, scope: !70)
!86 = !DILocation(line: 109, column: 5, scope: !70)
!87 = !DILocation(line: 111, column: 5, scope: !70)
!88 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 55, type: !13, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!89 = !DILocalVariable(name: "h", scope: !88, file: !12, line: 57, type: !17)
!90 = !DILocation(line: 57, column: 9, scope: !88)
!91 = !DILocalVariable(name: "data", scope: !88, file: !12, line: 58, type: !20)
!92 = !DILocation(line: 58, column: 12, scope: !88)
!93 = !DILocalVariable(name: "dataBadBuffer", scope: !88, file: !12, line: 59, type: !24)
!94 = !DILocation(line: 59, column: 10, scope: !88)
!95 = !DILocalVariable(name: "dataGoodBuffer", scope: !88, file: !12, line: 60, type: !29)
!96 = !DILocation(line: 60, column: 10, scope: !88)
!97 = !DILocation(line: 61, column: 5, scope: !88)
!98 = !DILocation(line: 62, column: 5, scope: !88)
!99 = !DILocation(line: 62, column: 25, scope: !88)
!100 = !DILocation(line: 63, column: 5, scope: !88)
!101 = !DILocation(line: 64, column: 5, scope: !88)
!102 = !DILocation(line: 64, column: 27, scope: !88)
!103 = !DILocation(line: 65, column: 11, scope: !104)
!104 = distinct !DILexicalBlock(scope: !88, file: !12, line: 65, column: 5)
!105 = !DILocation(line: 65, column: 9, scope: !104)
!106 = !DILocation(line: 65, column: 16, scope: !107)
!107 = distinct !DILexicalBlock(scope: !104, file: !12, line: 65, column: 5)
!108 = !DILocation(line: 65, column: 18, scope: !107)
!109 = !DILocation(line: 65, column: 5, scope: !104)
!110 = !DILocation(line: 68, column: 16, scope: !111)
!111 = distinct !DILexicalBlock(scope: !107, file: !12, line: 66, column: 5)
!112 = !DILocation(line: 68, column: 14, scope: !111)
!113 = !DILocation(line: 69, column: 5, scope: !111)
!114 = !DILocation(line: 65, column: 24, scope: !107)
!115 = !DILocation(line: 65, column: 5, scope: !107)
!116 = distinct !{!116, !109, !117, !54}
!117 = !DILocation(line: 69, column: 5, scope: !104)
!118 = !DILocalVariable(name: "dest", scope: !119, file: !12, line: 71, type: !29)
!119 = distinct !DILexicalBlock(scope: !88, file: !12, line: 70, column: 5)
!120 = !DILocation(line: 71, column: 14, scope: !119)
!121 = !DILocation(line: 72, column: 9, scope: !119)
!122 = !DILocation(line: 73, column: 9, scope: !119)
!123 = !DILocation(line: 73, column: 21, scope: !119)
!124 = !DILocation(line: 76, column: 9, scope: !119)
!125 = !DILocation(line: 77, column: 9, scope: !119)
!126 = !DILocation(line: 77, column: 21, scope: !119)
!127 = !DILocation(line: 78, column: 19, scope: !119)
!128 = !DILocation(line: 78, column: 9, scope: !119)
!129 = !DILocation(line: 80, column: 1, scope: !88)
