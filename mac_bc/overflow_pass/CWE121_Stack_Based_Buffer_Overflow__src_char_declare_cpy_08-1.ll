; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_08-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_08-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_08_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !16, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !20, metadata !DIExpression()), !dbg !24
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !25
  store i8* %arraydecay, i8** %data, align 8, !dbg !26
  %call = call i32 @staticReturnsTrue(), !dbg !27
  %tobool = icmp ne i32 %call, 0, !dbg !27
  br i1 %tobool, label %if.then, label %if.end, !dbg !29

if.then:                                          ; preds = %entry
  %0 = load i8*, i8** %data, align 8, !dbg !30
  %1 = load i8*, i8** %data, align 8, !dbg !30
  %2 = call i64 @llvm.objectsize.i64.p0i8(i8* %1, i1 false, i1 true, i1 false), !dbg !30
  %call1 = call i8* @__memset_chk(i8* noundef %0, i32 noundef 65, i64 noundef 99, i64 noundef %2) #5, !dbg !30
  %3 = load i8*, i8** %data, align 8, !dbg !32
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !32
  store i8 0, i8* %arrayidx, align 1, !dbg !33
  br label %if.end, !dbg !34

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !35, metadata !DIExpression()), !dbg !40
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !40
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !40
  %arraydecay2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !41
  %5 = load i8*, i8** %data, align 8, !dbg !41
  %call3 = call i8* @__strcpy_chk(i8* noundef %arraydecay2, i8* noundef %5, i64 noundef 50) #5, !dbg !41
  %6 = load i8*, i8** %data, align 8, !dbg !42
  call void @printLine(i8* noundef %6), !dbg !43
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
define void @CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_08_good() #0 !dbg !45 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_08_good(), !dbg !62
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !63
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !64
  call void @CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_08_bad(), !dbg !65
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !66
  ret i32 0, !dbg !67
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !68 {
entry:
  ret i32 1, !dbg !71
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !72 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !73, metadata !DIExpression()), !dbg !74
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !75, metadata !DIExpression()), !dbg !76
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !77
  store i8* %arraydecay, i8** %data, align 8, !dbg !78
  %call = call i32 @staticReturnsFalse(), !dbg !79
  %tobool = icmp ne i32 %call, 0, !dbg !79
  br i1 %tobool, label %if.then, label %if.else, !dbg !81

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !82
  br label %if.end, !dbg !84

if.else:                                          ; preds = %entry
  %0 = load i8*, i8** %data, align 8, !dbg !85
  %1 = load i8*, i8** %data, align 8, !dbg !85
  %2 = call i64 @llvm.objectsize.i64.p0i8(i8* %1, i1 false, i1 true, i1 false), !dbg !85
  %call1 = call i8* @__memset_chk(i8* noundef %0, i32 noundef 65, i64 noundef 49, i64 noundef %2) #5, !dbg !85
  %3 = load i8*, i8** %data, align 8, !dbg !87
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !87
  store i8 0, i8* %arrayidx, align 1, !dbg !88
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !89, metadata !DIExpression()), !dbg !91
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !91
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !91
  %arraydecay2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !92
  %5 = load i8*, i8** %data, align 8, !dbg !92
  %call3 = call i8* @__strcpy_chk(i8* noundef %arraydecay2, i8* noundef %5, i64 noundef 50) #5, !dbg !92
  %6 = load i8*, i8** %data, align 8, !dbg !93
  call void @printLine(i8* noundef %6), !dbg !94
  ret void, !dbg !95
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !96 {
entry:
  ret i32 0, !dbg !97
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !98 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !99, metadata !DIExpression()), !dbg !100
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !101, metadata !DIExpression()), !dbg !102
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !103
  store i8* %arraydecay, i8** %data, align 8, !dbg !104
  %call = call i32 @staticReturnsTrue(), !dbg !105
  %tobool = icmp ne i32 %call, 0, !dbg !105
  br i1 %tobool, label %if.then, label %if.end, !dbg !107

if.then:                                          ; preds = %entry
  %0 = load i8*, i8** %data, align 8, !dbg !108
  %1 = load i8*, i8** %data, align 8, !dbg !108
  %2 = call i64 @llvm.objectsize.i64.p0i8(i8* %1, i1 false, i1 true, i1 false), !dbg !108
  %call1 = call i8* @__memset_chk(i8* noundef %0, i32 noundef 65, i64 noundef 49, i64 noundef %2) #5, !dbg !108
  %3 = load i8*, i8** %data, align 8, !dbg !110
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !110
  store i8 0, i8* %arrayidx, align 1, !dbg !111
  br label %if.end, !dbg !112

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !113, metadata !DIExpression()), !dbg !115
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !115
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !115
  %arraydecay2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !116
  %5 = load i8*, i8** %data, align 8, !dbg !116
  %call3 = call i8* @__strcpy_chk(i8* noundef %arraydecay2, i8* noundef %5, i64 noundef 50) #5, !dbg !116
  %6 = load i8*, i8** %data, align 8, !dbg !117
  call void @printLine(i8* noundef %6), !dbg !118
  ret void, !dbg !119
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_08-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_08_bad", scope: !12, file: !12, line: 37, type: !13, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_08-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 39, type: !17)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!19 = !DILocation(line: 39, column: 12, scope: !11)
!20 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 40, type: !21)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 800, elements: !22)
!22 = !{!23}
!23 = !DISubrange(count: 100)
!24 = !DILocation(line: 40, column: 10, scope: !11)
!25 = !DILocation(line: 41, column: 12, scope: !11)
!26 = !DILocation(line: 41, column: 10, scope: !11)
!27 = !DILocation(line: 42, column: 8, scope: !28)
!28 = distinct !DILexicalBlock(scope: !11, file: !12, line: 42, column: 8)
!29 = !DILocation(line: 42, column: 8, scope: !11)
!30 = !DILocation(line: 45, column: 9, scope: !31)
!31 = distinct !DILexicalBlock(scope: !28, file: !12, line: 43, column: 5)
!32 = !DILocation(line: 46, column: 9, scope: !31)
!33 = !DILocation(line: 46, column: 21, scope: !31)
!34 = !DILocation(line: 47, column: 5, scope: !31)
!35 = !DILocalVariable(name: "dest", scope: !36, file: !12, line: 49, type: !37)
!36 = distinct !DILexicalBlock(scope: !11, file: !12, line: 48, column: 5)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 400, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 50)
!40 = !DILocation(line: 49, column: 14, scope: !36)
!41 = !DILocation(line: 51, column: 9, scope: !36)
!42 = !DILocation(line: 52, column: 19, scope: !36)
!43 = !DILocation(line: 52, column: 9, scope: !36)
!44 = !DILocation(line: 54, column: 1, scope: !11)
!45 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_08_good", scope: !12, file: !12, line: 105, type: !13, scopeLine: 106, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!46 = !DILocation(line: 107, column: 5, scope: !45)
!47 = !DILocation(line: 108, column: 5, scope: !45)
!48 = !DILocation(line: 109, column: 1, scope: !45)
!49 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 121, type: !50, scopeLine: 122, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!50 = !DISubroutineType(types: !51)
!51 = !{!52, !52, !53}
!52 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!54 = !DILocalVariable(name: "argc", arg: 1, scope: !49, file: !12, line: 121, type: !52)
!55 = !DILocation(line: 121, column: 14, scope: !49)
!56 = !DILocalVariable(name: "argv", arg: 2, scope: !49, file: !12, line: 121, type: !53)
!57 = !DILocation(line: 121, column: 27, scope: !49)
!58 = !DILocation(line: 124, column: 22, scope: !49)
!59 = !DILocation(line: 124, column: 12, scope: !49)
!60 = !DILocation(line: 124, column: 5, scope: !49)
!61 = !DILocation(line: 126, column: 5, scope: !49)
!62 = !DILocation(line: 127, column: 5, scope: !49)
!63 = !DILocation(line: 128, column: 5, scope: !49)
!64 = !DILocation(line: 131, column: 5, scope: !49)
!65 = !DILocation(line: 132, column: 5, scope: !49)
!66 = !DILocation(line: 133, column: 5, scope: !49)
!67 = !DILocation(line: 135, column: 5, scope: !49)
!68 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !12, file: !12, line: 25, type: !69, scopeLine: 26, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!69 = !DISubroutineType(types: !70)
!70 = !{!52}
!71 = !DILocation(line: 27, column: 5, scope: !68)
!72 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 61, type: !13, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!73 = !DILocalVariable(name: "data", scope: !72, file: !12, line: 63, type: !17)
!74 = !DILocation(line: 63, column: 12, scope: !72)
!75 = !DILocalVariable(name: "dataBuffer", scope: !72, file: !12, line: 64, type: !21)
!76 = !DILocation(line: 64, column: 10, scope: !72)
!77 = !DILocation(line: 65, column: 12, scope: !72)
!78 = !DILocation(line: 65, column: 10, scope: !72)
!79 = !DILocation(line: 66, column: 8, scope: !80)
!80 = distinct !DILexicalBlock(scope: !72, file: !12, line: 66, column: 8)
!81 = !DILocation(line: 66, column: 8, scope: !72)
!82 = !DILocation(line: 69, column: 9, scope: !83)
!83 = distinct !DILexicalBlock(scope: !80, file: !12, line: 67, column: 5)
!84 = !DILocation(line: 70, column: 5, scope: !83)
!85 = !DILocation(line: 74, column: 9, scope: !86)
!86 = distinct !DILexicalBlock(scope: !80, file: !12, line: 72, column: 5)
!87 = !DILocation(line: 75, column: 9, scope: !86)
!88 = !DILocation(line: 75, column: 20, scope: !86)
!89 = !DILocalVariable(name: "dest", scope: !90, file: !12, line: 78, type: !37)
!90 = distinct !DILexicalBlock(scope: !72, file: !12, line: 77, column: 5)
!91 = !DILocation(line: 78, column: 14, scope: !90)
!92 = !DILocation(line: 80, column: 9, scope: !90)
!93 = !DILocation(line: 81, column: 19, scope: !90)
!94 = !DILocation(line: 81, column: 9, scope: !90)
!95 = !DILocation(line: 83, column: 1, scope: !72)
!96 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !12, file: !12, line: 30, type: !69, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!97 = !DILocation(line: 32, column: 5, scope: !96)
!98 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 86, type: !13, scopeLine: 87, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!99 = !DILocalVariable(name: "data", scope: !98, file: !12, line: 88, type: !17)
!100 = !DILocation(line: 88, column: 12, scope: !98)
!101 = !DILocalVariable(name: "dataBuffer", scope: !98, file: !12, line: 89, type: !21)
!102 = !DILocation(line: 89, column: 10, scope: !98)
!103 = !DILocation(line: 90, column: 12, scope: !98)
!104 = !DILocation(line: 90, column: 10, scope: !98)
!105 = !DILocation(line: 91, column: 8, scope: !106)
!106 = distinct !DILexicalBlock(scope: !98, file: !12, line: 91, column: 8)
!107 = !DILocation(line: 91, column: 8, scope: !98)
!108 = !DILocation(line: 94, column: 9, scope: !109)
!109 = distinct !DILexicalBlock(scope: !106, file: !12, line: 92, column: 5)
!110 = !DILocation(line: 95, column: 9, scope: !109)
!111 = !DILocation(line: 95, column: 20, scope: !109)
!112 = !DILocation(line: 96, column: 5, scope: !109)
!113 = !DILocalVariable(name: "dest", scope: !114, file: !12, line: 98, type: !37)
!114 = distinct !DILexicalBlock(scope: !98, file: !12, line: 97, column: 5)
!115 = !DILocation(line: 98, column: 14, scope: !114)
!116 = !DILocation(line: 100, column: 9, scope: !114)
!117 = !DILocation(line: 101, column: 19, scope: !114)
!118 = !DILocation(line: 101, column: 9, scope: !114)
!119 = !DILocation(line: 103, column: 1, scope: !98)
