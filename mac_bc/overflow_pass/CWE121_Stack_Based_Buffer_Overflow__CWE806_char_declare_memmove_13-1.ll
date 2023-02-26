; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memmove_13-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memmove_13-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@GLOBAL_CONST_FIVE = external constant i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memmove_13_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !16, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !20, metadata !DIExpression()), !dbg !24
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !25
  store i8* %arraydecay, i8** %data, align 8, !dbg !26
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !27
  %cmp = icmp eq i32 %0, 5, !dbg !29
  br i1 %cmp, label %if.then, label %if.end, !dbg !30

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !31
  %2 = load i8*, i8** %data, align 8, !dbg !31
  %3 = call i64 @llvm.objectsize.i64.p0i8(i8* %2, i1 false, i1 true, i1 false), !dbg !31
  %call = call i8* @__memset_chk(i8* noundef %1, i32 noundef 65, i64 noundef 99, i64 noundef %3) #5, !dbg !31
  %4 = load i8*, i8** %data, align 8, !dbg !33
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 99, !dbg !33
  store i8 0, i8* %arrayidx, align 1, !dbg !34
  br label %if.end, !dbg !35

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !36, metadata !DIExpression()), !dbg !41
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !41
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !41
  %arraydecay1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !42
  %6 = load i8*, i8** %data, align 8, !dbg !42
  %7 = load i8*, i8** %data, align 8, !dbg !42
  %call2 = call i64 @strlen(i8* noundef %7), !dbg !42
  %mul = mul i64 %call2, 1, !dbg !42
  %call3 = call i8* @__memmove_chk(i8* noundef %arraydecay1, i8* noundef %6, i64 noundef %mul, i64 noundef 50) #5, !dbg !42
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !43
  store i8 0, i8* %arrayidx4, align 1, !dbg !44
  %8 = load i8*, i8** %data, align 8, !dbg !45
  call void @printLine(i8* noundef %8), !dbg !46
  ret void, !dbg !47
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
declare i8* @__memmove_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #2

declare i64 @strlen(i8* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memmove_13_good() #0 !dbg !48 {
entry:
  call void @goodG2B1(), !dbg !49
  call void @goodG2B2(), !dbg !50
  ret void, !dbg !51
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !52 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !57, metadata !DIExpression()), !dbg !58
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !59, metadata !DIExpression()), !dbg !60
  %call = call i64 @time(i64* noundef null), !dbg !61
  %conv = trunc i64 %call to i32, !dbg !62
  call void @srand(i32 noundef %conv), !dbg !63
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !64
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memmove_13_good(), !dbg !65
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !66
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !67
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memmove_13_bad(), !dbg !68
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !69
  ret i32 0, !dbg !70
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !71 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !72, metadata !DIExpression()), !dbg !73
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !74, metadata !DIExpression()), !dbg !75
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !76
  store i8* %arraydecay, i8** %data, align 8, !dbg !77
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !78
  %cmp = icmp ne i32 %0, 5, !dbg !80
  br i1 %cmp, label %if.then, label %if.else, !dbg !81

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !82
  br label %if.end, !dbg !84

if.else:                                          ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !85
  %2 = load i8*, i8** %data, align 8, !dbg !85
  %3 = call i64 @llvm.objectsize.i64.p0i8(i8* %2, i1 false, i1 true, i1 false), !dbg !85
  %call = call i8* @__memset_chk(i8* noundef %1, i32 noundef 65, i64 noundef 49, i64 noundef %3) #5, !dbg !85
  %4 = load i8*, i8** %data, align 8, !dbg !87
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 49, !dbg !87
  store i8 0, i8* %arrayidx, align 1, !dbg !88
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !89, metadata !DIExpression()), !dbg !91
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !91
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !91
  %arraydecay1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !92
  %6 = load i8*, i8** %data, align 8, !dbg !92
  %7 = load i8*, i8** %data, align 8, !dbg !92
  %call2 = call i64 @strlen(i8* noundef %7), !dbg !92
  %mul = mul i64 %call2, 1, !dbg !92
  %call3 = call i8* @__memmove_chk(i8* noundef %arraydecay1, i8* noundef %6, i64 noundef %mul, i64 noundef 50) #5, !dbg !92
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !93
  store i8 0, i8* %arrayidx4, align 1, !dbg !94
  %8 = load i8*, i8** %data, align 8, !dbg !95
  call void @printLine(i8* noundef %8), !dbg !96
  ret void, !dbg !97
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
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !105
  %cmp = icmp eq i32 %0, 5, !dbg !107
  br i1 %cmp, label %if.then, label %if.end, !dbg !108

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !109
  %2 = load i8*, i8** %data, align 8, !dbg !109
  %3 = call i64 @llvm.objectsize.i64.p0i8(i8* %2, i1 false, i1 true, i1 false), !dbg !109
  %call = call i8* @__memset_chk(i8* noundef %1, i32 noundef 65, i64 noundef 49, i64 noundef %3) #5, !dbg !109
  %4 = load i8*, i8** %data, align 8, !dbg !111
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 49, !dbg !111
  store i8 0, i8* %arrayidx, align 1, !dbg !112
  br label %if.end, !dbg !113

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !114, metadata !DIExpression()), !dbg !116
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !116
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !116
  %arraydecay1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !117
  %6 = load i8*, i8** %data, align 8, !dbg !117
  %7 = load i8*, i8** %data, align 8, !dbg !117
  %call2 = call i64 @strlen(i8* noundef %7), !dbg !117
  %mul = mul i64 %call2, 1, !dbg !117
  %call3 = call i8* @__memmove_chk(i8* noundef %arraydecay1, i8* noundef %6, i64 noundef %mul, i64 noundef 50) #5, !dbg !117
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !118
  store i8 0, i8* %arrayidx4, align 1, !dbg !119
  %8 = load i8*, i8** %data, align 8, !dbg !120
  call void @printLine(i8* noundef %8), !dbg !121
  ret void, !dbg !122
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memmove_13-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memmove_13_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memmove_13-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!29 = !DILocation(line: 28, column: 25, scope: !28)
!30 = !DILocation(line: 28, column: 8, scope: !11)
!31 = !DILocation(line: 31, column: 9, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !12, line: 29, column: 5)
!33 = !DILocation(line: 32, column: 9, scope: !32)
!34 = !DILocation(line: 32, column: 21, scope: !32)
!35 = !DILocation(line: 33, column: 5, scope: !32)
!36 = !DILocalVariable(name: "dest", scope: !37, file: !12, line: 35, type: !38)
!37 = distinct !DILexicalBlock(scope: !11, file: !12, line: 34, column: 5)
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 400, elements: !39)
!39 = !{!40}
!40 = !DISubrange(count: 50)
!41 = !DILocation(line: 35, column: 14, scope: !37)
!42 = !DILocation(line: 37, column: 9, scope: !37)
!43 = !DILocation(line: 38, column: 9, scope: !37)
!44 = !DILocation(line: 38, column: 20, scope: !37)
!45 = !DILocation(line: 39, column: 19, scope: !37)
!46 = !DILocation(line: 39, column: 9, scope: !37)
!47 = !DILocation(line: 41, column: 1, scope: !11)
!48 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memmove_13_good", scope: !12, file: !12, line: 94, type: !13, scopeLine: 95, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!49 = !DILocation(line: 96, column: 5, scope: !48)
!50 = !DILocation(line: 97, column: 5, scope: !48)
!51 = !DILocation(line: 98, column: 1, scope: !48)
!52 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 110, type: !53, scopeLine: 111, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!53 = !DISubroutineType(types: !54)
!54 = !{!55, !55, !56}
!55 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!57 = !DILocalVariable(name: "argc", arg: 1, scope: !52, file: !12, line: 110, type: !55)
!58 = !DILocation(line: 110, column: 14, scope: !52)
!59 = !DILocalVariable(name: "argv", arg: 2, scope: !52, file: !12, line: 110, type: !56)
!60 = !DILocation(line: 110, column: 27, scope: !52)
!61 = !DILocation(line: 113, column: 22, scope: !52)
!62 = !DILocation(line: 113, column: 12, scope: !52)
!63 = !DILocation(line: 113, column: 5, scope: !52)
!64 = !DILocation(line: 115, column: 5, scope: !52)
!65 = !DILocation(line: 116, column: 5, scope: !52)
!66 = !DILocation(line: 117, column: 5, scope: !52)
!67 = !DILocation(line: 120, column: 5, scope: !52)
!68 = !DILocation(line: 121, column: 5, scope: !52)
!69 = !DILocation(line: 122, column: 5, scope: !52)
!70 = !DILocation(line: 124, column: 5, scope: !52)
!71 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 48, type: !13, scopeLine: 49, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!72 = !DILocalVariable(name: "data", scope: !71, file: !12, line: 50, type: !17)
!73 = !DILocation(line: 50, column: 12, scope: !71)
!74 = !DILocalVariable(name: "dataBuffer", scope: !71, file: !12, line: 51, type: !21)
!75 = !DILocation(line: 51, column: 10, scope: !71)
!76 = !DILocation(line: 52, column: 12, scope: !71)
!77 = !DILocation(line: 52, column: 10, scope: !71)
!78 = !DILocation(line: 53, column: 8, scope: !79)
!79 = distinct !DILexicalBlock(scope: !71, file: !12, line: 53, column: 8)
!80 = !DILocation(line: 53, column: 25, scope: !79)
!81 = !DILocation(line: 53, column: 8, scope: !71)
!82 = !DILocation(line: 56, column: 9, scope: !83)
!83 = distinct !DILexicalBlock(scope: !79, file: !12, line: 54, column: 5)
!84 = !DILocation(line: 57, column: 5, scope: !83)
!85 = !DILocation(line: 61, column: 9, scope: !86)
!86 = distinct !DILexicalBlock(scope: !79, file: !12, line: 59, column: 5)
!87 = !DILocation(line: 62, column: 9, scope: !86)
!88 = !DILocation(line: 62, column: 20, scope: !86)
!89 = !DILocalVariable(name: "dest", scope: !90, file: !12, line: 65, type: !38)
!90 = distinct !DILexicalBlock(scope: !71, file: !12, line: 64, column: 5)
!91 = !DILocation(line: 65, column: 14, scope: !90)
!92 = !DILocation(line: 67, column: 9, scope: !90)
!93 = !DILocation(line: 68, column: 9, scope: !90)
!94 = !DILocation(line: 68, column: 20, scope: !90)
!95 = !DILocation(line: 69, column: 19, scope: !90)
!96 = !DILocation(line: 69, column: 9, scope: !90)
!97 = !DILocation(line: 71, column: 1, scope: !71)
!98 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 74, type: !13, scopeLine: 75, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!99 = !DILocalVariable(name: "data", scope: !98, file: !12, line: 76, type: !17)
!100 = !DILocation(line: 76, column: 12, scope: !98)
!101 = !DILocalVariable(name: "dataBuffer", scope: !98, file: !12, line: 77, type: !21)
!102 = !DILocation(line: 77, column: 10, scope: !98)
!103 = !DILocation(line: 78, column: 12, scope: !98)
!104 = !DILocation(line: 78, column: 10, scope: !98)
!105 = !DILocation(line: 79, column: 8, scope: !106)
!106 = distinct !DILexicalBlock(scope: !98, file: !12, line: 79, column: 8)
!107 = !DILocation(line: 79, column: 25, scope: !106)
!108 = !DILocation(line: 79, column: 8, scope: !98)
!109 = !DILocation(line: 82, column: 9, scope: !110)
!110 = distinct !DILexicalBlock(scope: !106, file: !12, line: 80, column: 5)
!111 = !DILocation(line: 83, column: 9, scope: !110)
!112 = !DILocation(line: 83, column: 20, scope: !110)
!113 = !DILocation(line: 84, column: 5, scope: !110)
!114 = !DILocalVariable(name: "dest", scope: !115, file: !12, line: 86, type: !38)
!115 = distinct !DILexicalBlock(scope: !98, file: !12, line: 85, column: 5)
!116 = !DILocation(line: 86, column: 14, scope: !115)
!117 = !DILocation(line: 88, column: 9, scope: !115)
!118 = !DILocation(line: 89, column: 9, scope: !115)
!119 = !DILocation(line: 89, column: 20, scope: !115)
!120 = !DILocation(line: 90, column: 19, scope: !115)
!121 = !DILocation(line: 90, column: 9, scope: !115)
!122 = !DILocation(line: 92, column: 1, scope: !98)
