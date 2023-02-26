; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_10-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_10-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@globalTrue = external global i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@globalFalse = external global i32, align 4
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_10_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !16, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !20, metadata !DIExpression()), !dbg !24
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !25
  store i8* %arraydecay, i8** %data, align 8, !dbg !26
  %0 = load i32, i32* @globalTrue, align 4, !dbg !27
  %tobool = icmp ne i32 %0, 0, !dbg !27
  br i1 %tobool, label %if.then, label %if.end, !dbg !29

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !30
  %2 = load i8*, i8** %data, align 8, !dbg !30
  %3 = call i64 @llvm.objectsize.i64.p0i8(i8* %2, i1 false, i1 true, i1 false), !dbg !30
  %call = call i8* @__memset_chk(i8* noundef %1, i32 noundef 65, i64 noundef 99, i64 noundef %3) #5, !dbg !30
  %4 = load i8*, i8** %data, align 8, !dbg !32
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 99, !dbg !32
  store i8 0, i8* %arrayidx, align 1, !dbg !33
  br label %if.end, !dbg !34

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !35, metadata !DIExpression()), !dbg !40
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !40
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !40
  %arraydecay1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !41
  %6 = load i8*, i8** %data, align 8, !dbg !41
  %call2 = call i8* @__strcpy_chk(i8* noundef %arraydecay1, i8* noundef %6, i64 noundef 50) #5, !dbg !41
  %7 = load i8*, i8** %data, align 8, !dbg !42
  call void @printLine(i8* noundef %7), !dbg !43
  ret void, !dbg !44
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare i8* @__memset_chk(i8* noundef, i32 noundef, i64 noundef, i64 noundef) #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare i8* @__strcpy_chk(i8* noundef, i8* noundef, i64 noundef) #2

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_10_good() #0 !dbg !45 {
entry:
  call void @goodG2B1(), !dbg !46
  call void @goodG2B2(), !dbg !47
  ret void, !dbg !48
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !49 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !54, metadata !DIExpression()), !dbg !55
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !56, metadata !DIExpression()), !dbg !57
  %call = call i64 @time(i64* noundef null), !dbg !58
  %conv = trunc i64 %call to i32, !dbg !59
  call void @srand(i32 noundef %conv), !dbg !60
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !61
  call void @CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_10_good(), !dbg !62
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !63
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !64
  call void @CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_10_bad(), !dbg !65
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !66
  ret i32 0, !dbg !67
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !68 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !69, metadata !DIExpression()), !dbg !70
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !71, metadata !DIExpression()), !dbg !72
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !73
  store i8* %arraydecay, i8** %data, align 8, !dbg !74
  %0 = load i32, i32* @globalFalse, align 4, !dbg !75
  %tobool = icmp ne i32 %0, 0, !dbg !75
  br i1 %tobool, label %if.then, label %if.else, !dbg !77

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !78
  br label %if.end, !dbg !80

if.else:                                          ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !81
  %2 = load i8*, i8** %data, align 8, !dbg !81
  %3 = call i64 @llvm.objectsize.i64.p0i8(i8* %2, i1 false, i1 true, i1 false), !dbg !81
  %call = call i8* @__memset_chk(i8* noundef %1, i32 noundef 65, i64 noundef 49, i64 noundef %3) #5, !dbg !81
  %4 = load i8*, i8** %data, align 8, !dbg !83
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 49, !dbg !83
  store i8 0, i8* %arrayidx, align 1, !dbg !84
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !85, metadata !DIExpression()), !dbg !87
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !87
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !87
  %arraydecay1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !88
  %6 = load i8*, i8** %data, align 8, !dbg !88
  %call2 = call i8* @__strcpy_chk(i8* noundef %arraydecay1, i8* noundef %6, i64 noundef 50) #5, !dbg !88
  %7 = load i8*, i8** %data, align 8, !dbg !89
  call void @printLine(i8* noundef %7), !dbg !90
  ret void, !dbg !91
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !92 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !93, metadata !DIExpression()), !dbg !94
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !95, metadata !DIExpression()), !dbg !96
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !97
  store i8* %arraydecay, i8** %data, align 8, !dbg !98
  %0 = load i32, i32* @globalTrue, align 4, !dbg !99
  %tobool = icmp ne i32 %0, 0, !dbg !99
  br i1 %tobool, label %if.then, label %if.end, !dbg !101

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !102
  %2 = load i8*, i8** %data, align 8, !dbg !102
  %3 = call i64 @llvm.objectsize.i64.p0i8(i8* %2, i1 false, i1 true, i1 false), !dbg !102
  %call = call i8* @__memset_chk(i8* noundef %1, i32 noundef 65, i64 noundef 49, i64 noundef %3) #5, !dbg !102
  %4 = load i8*, i8** %data, align 8, !dbg !104
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 49, !dbg !104
  store i8 0, i8* %arrayidx, align 1, !dbg !105
  br label %if.end, !dbg !106

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !107, metadata !DIExpression()), !dbg !109
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !109
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !109
  %arraydecay1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !110
  %6 = load i8*, i8** %data, align 8, !dbg !110
  %call2 = call i8* @__strcpy_chk(i8* noundef %arraydecay1, i8* noundef %6, i64 noundef 50) #5, !dbg !110
  %7 = load i8*, i8** %data, align 8, !dbg !111
  call void @printLine(i8* noundef %7), !dbg !112
  ret void, !dbg !113
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_10-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_10_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_10-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !17)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!19 = !DILocation(line: 25, column: 12, scope: !11)
!20 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 26, type: !21)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 800, elements: !22)
!22 = !{!23}
!23 = !DISubrange(count: 100)
!24 = !DILocation(line: 26, column: 10, scope: !11)
!25 = !DILocation(line: 27, column: 12, scope: !11)
!26 = !DILocation(line: 27, column: 10, scope: !11)
!27 = !DILocation(line: 28, column: 8, scope: !28)
!28 = distinct !DILexicalBlock(scope: !11, file: !12, line: 28, column: 8)
!29 = !DILocation(line: 28, column: 8, scope: !11)
!30 = !DILocation(line: 31, column: 9, scope: !31)
!31 = distinct !DILexicalBlock(scope: !28, file: !12, line: 29, column: 5)
!32 = !DILocation(line: 32, column: 9, scope: !31)
!33 = !DILocation(line: 32, column: 21, scope: !31)
!34 = !DILocation(line: 33, column: 5, scope: !31)
!35 = !DILocalVariable(name: "dest", scope: !36, file: !12, line: 35, type: !37)
!36 = distinct !DILexicalBlock(scope: !11, file: !12, line: 34, column: 5)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 400, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 50)
!40 = !DILocation(line: 35, column: 14, scope: !36)
!41 = !DILocation(line: 37, column: 9, scope: !36)
!42 = !DILocation(line: 38, column: 19, scope: !36)
!43 = !DILocation(line: 38, column: 9, scope: !36)
!44 = !DILocation(line: 40, column: 1, scope: !11)
!45 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_10_good", scope: !12, file: !12, line: 91, type: !13, scopeLine: 92, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!46 = !DILocation(line: 93, column: 5, scope: !45)
!47 = !DILocation(line: 94, column: 5, scope: !45)
!48 = !DILocation(line: 95, column: 1, scope: !45)
!49 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 107, type: !50, scopeLine: 108, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!50 = !DISubroutineType(types: !51)
!51 = !{!52, !52, !53}
!52 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!54 = !DILocalVariable(name: "argc", arg: 1, scope: !49, file: !12, line: 107, type: !52)
!55 = !DILocation(line: 107, column: 14, scope: !49)
!56 = !DILocalVariable(name: "argv", arg: 2, scope: !49, file: !12, line: 107, type: !53)
!57 = !DILocation(line: 107, column: 27, scope: !49)
!58 = !DILocation(line: 110, column: 22, scope: !49)
!59 = !DILocation(line: 110, column: 12, scope: !49)
!60 = !DILocation(line: 110, column: 5, scope: !49)
!61 = !DILocation(line: 112, column: 5, scope: !49)
!62 = !DILocation(line: 113, column: 5, scope: !49)
!63 = !DILocation(line: 114, column: 5, scope: !49)
!64 = !DILocation(line: 117, column: 5, scope: !49)
!65 = !DILocation(line: 118, column: 5, scope: !49)
!66 = !DILocation(line: 119, column: 5, scope: !49)
!67 = !DILocation(line: 121, column: 5, scope: !49)
!68 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 47, type: !13, scopeLine: 48, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!69 = !DILocalVariable(name: "data", scope: !68, file: !12, line: 49, type: !17)
!70 = !DILocation(line: 49, column: 12, scope: !68)
!71 = !DILocalVariable(name: "dataBuffer", scope: !68, file: !12, line: 50, type: !21)
!72 = !DILocation(line: 50, column: 10, scope: !68)
!73 = !DILocation(line: 51, column: 12, scope: !68)
!74 = !DILocation(line: 51, column: 10, scope: !68)
!75 = !DILocation(line: 52, column: 8, scope: !76)
!76 = distinct !DILexicalBlock(scope: !68, file: !12, line: 52, column: 8)
!77 = !DILocation(line: 52, column: 8, scope: !68)
!78 = !DILocation(line: 55, column: 9, scope: !79)
!79 = distinct !DILexicalBlock(scope: !76, file: !12, line: 53, column: 5)
!80 = !DILocation(line: 56, column: 5, scope: !79)
!81 = !DILocation(line: 60, column: 9, scope: !82)
!82 = distinct !DILexicalBlock(scope: !76, file: !12, line: 58, column: 5)
!83 = !DILocation(line: 61, column: 9, scope: !82)
!84 = !DILocation(line: 61, column: 20, scope: !82)
!85 = !DILocalVariable(name: "dest", scope: !86, file: !12, line: 64, type: !37)
!86 = distinct !DILexicalBlock(scope: !68, file: !12, line: 63, column: 5)
!87 = !DILocation(line: 64, column: 14, scope: !86)
!88 = !DILocation(line: 66, column: 9, scope: !86)
!89 = !DILocation(line: 67, column: 19, scope: !86)
!90 = !DILocation(line: 67, column: 9, scope: !86)
!91 = !DILocation(line: 69, column: 1, scope: !68)
!92 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 72, type: !13, scopeLine: 73, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!93 = !DILocalVariable(name: "data", scope: !92, file: !12, line: 74, type: !17)
!94 = !DILocation(line: 74, column: 12, scope: !92)
!95 = !DILocalVariable(name: "dataBuffer", scope: !92, file: !12, line: 75, type: !21)
!96 = !DILocation(line: 75, column: 10, scope: !92)
!97 = !DILocation(line: 76, column: 12, scope: !92)
!98 = !DILocation(line: 76, column: 10, scope: !92)
!99 = !DILocation(line: 77, column: 8, scope: !100)
!100 = distinct !DILexicalBlock(scope: !92, file: !12, line: 77, column: 8)
!101 = !DILocation(line: 77, column: 8, scope: !92)
!102 = !DILocation(line: 80, column: 9, scope: !103)
!103 = distinct !DILexicalBlock(scope: !100, file: !12, line: 78, column: 5)
!104 = !DILocation(line: 81, column: 9, scope: !103)
!105 = !DILocation(line: 81, column: 20, scope: !103)
!106 = !DILocation(line: 82, column: 5, scope: !103)
!107 = !DILocalVariable(name: "dest", scope: !108, file: !12, line: 84, type: !37)
!108 = distinct !DILexicalBlock(scope: !92, file: !12, line: 83, column: 5)
!109 = !DILocation(line: 84, column: 14, scope: !108)
!110 = !DILocation(line: 86, column: 9, scope: !108)
!111 = !DILocation(line: 87, column: 19, scope: !108)
!112 = !DILocation(line: 87, column: 9, scope: !108)
!113 = !DILocation(line: 89, column: 1, scope: !92)
