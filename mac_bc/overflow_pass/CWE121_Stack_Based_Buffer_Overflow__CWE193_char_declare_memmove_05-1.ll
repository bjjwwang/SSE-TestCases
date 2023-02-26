; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memmove_05-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memmove_05-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@staticTrue = internal global i32 1, align 4, !dbg !0
@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memmove_05_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !7
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.goodG2B2.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memmove_05_bad() #0 !dbg !18 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !22, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !31, metadata !DIExpression()), !dbg !35
  %0 = load i32, i32* @staticTrue, align 4, !dbg !36
  %tobool = icmp ne i32 %0, 0, !dbg !36
  br i1 %tobool, label %if.then, label %if.end, !dbg !38

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [10 x i8], [10 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !39
  store i8* %arraydecay, i8** %data, align 8, !dbg !41
  %1 = load i8*, i8** %data, align 8, !dbg !42
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !42
  store i8 0, i8* %arrayidx, align 1, !dbg !43
  br label %if.end, !dbg !44

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !45, metadata !DIExpression()), !dbg !47
  %2 = bitcast [11 x i8]* %source to i8*, !dbg !47
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memmove_05_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !47
  %3 = load i8*, i8** %data, align 8, !dbg !48
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !48
  %arraydecay2 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !48
  %call = call i64 @strlen(i8* noundef %arraydecay2), !dbg !48
  %add = add i64 %call, 1, !dbg !48
  %mul = mul i64 %add, 1, !dbg !48
  %4 = load i8*, i8** %data, align 8, !dbg !48
  %5 = call i64 @llvm.objectsize.i64.p0i8(i8* %4, i1 false, i1 true, i1 false), !dbg !48
  %call3 = call i8* @__memmove_chk(i8* noundef %3, i8* noundef %arraydecay1, i64 noundef %mul, i64 noundef %5) #5, !dbg !48
  %6 = load i8*, i8** %data, align 8, !dbg !49
  call void @printLine(i8* noundef %6), !dbg !50
  ret void, !dbg !51
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind
declare i8* @__memmove_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #3

declare i64 @strlen(i8* noundef) #4

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memmove_05_good() #0 !dbg !52 {
entry:
  call void @goodG2B1(), !dbg !53
  call void @goodG2B2(), !dbg !54
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !60, metadata !DIExpression()), !dbg !61
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !62, metadata !DIExpression()), !dbg !63
  %call = call i64 @time(i64* noundef null), !dbg !64
  %conv = trunc i64 %call to i32, !dbg !65
  call void @srand(i32 noundef %conv), !dbg !66
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !67
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memmove_05_good(), !dbg !68
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !69
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !70
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memmove_05_bad(), !dbg !71
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !72
  ret i32 0, !dbg !73
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !74 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !75, metadata !DIExpression()), !dbg !76
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !77, metadata !DIExpression()), !dbg !78
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !79, metadata !DIExpression()), !dbg !80
  %0 = load i32, i32* @staticFalse, align 4, !dbg !81
  %tobool = icmp ne i32 %0, 0, !dbg !81
  br i1 %tobool, label %if.then, label %if.else, !dbg !83

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !84
  br label %if.end, !dbg !86

if.else:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !87
  store i8* %arraydecay, i8** %data, align 8, !dbg !89
  %1 = load i8*, i8** %data, align 8, !dbg !90
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !90
  store i8 0, i8* %arrayidx, align 1, !dbg !91
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !92, metadata !DIExpression()), !dbg !94
  %2 = bitcast [11 x i8]* %source to i8*, !dbg !94
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B1.source, i32 0, i32 0), i64 11, i1 false), !dbg !94
  %3 = load i8*, i8** %data, align 8, !dbg !95
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !95
  %arraydecay2 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !95
  %call = call i64 @strlen(i8* noundef %arraydecay2), !dbg !95
  %add = add i64 %call, 1, !dbg !95
  %mul = mul i64 %add, 1, !dbg !95
  %4 = load i8*, i8** %data, align 8, !dbg !95
  %5 = call i64 @llvm.objectsize.i64.p0i8(i8* %4, i1 false, i1 true, i1 false), !dbg !95
  %call3 = call i8* @__memmove_chk(i8* noundef %3, i8* noundef %arraydecay1, i64 noundef %mul, i64 noundef %5) #5, !dbg !95
  %6 = load i8*, i8** %data, align 8, !dbg !96
  call void @printLine(i8* noundef %6), !dbg !97
  ret void, !dbg !98
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !99 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !100, metadata !DIExpression()), !dbg !101
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !102, metadata !DIExpression()), !dbg !103
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !104, metadata !DIExpression()), !dbg !105
  %0 = load i32, i32* @staticTrue, align 4, !dbg !106
  %tobool = icmp ne i32 %0, 0, !dbg !106
  br i1 %tobool, label %if.then, label %if.end, !dbg !108

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !109
  store i8* %arraydecay, i8** %data, align 8, !dbg !111
  %1 = load i8*, i8** %data, align 8, !dbg !112
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !112
  store i8 0, i8* %arrayidx, align 1, !dbg !113
  br label %if.end, !dbg !114

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !115, metadata !DIExpression()), !dbg !117
  %2 = bitcast [11 x i8]* %source to i8*, !dbg !117
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B2.source, i32 0, i32 0), i64 11, i1 false), !dbg !117
  %3 = load i8*, i8** %data, align 8, !dbg !118
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !118
  %arraydecay2 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !118
  %call = call i64 @strlen(i8* noundef %arraydecay2), !dbg !118
  %add = add i64 %call, 1, !dbg !118
  %mul = mul i64 %add, 1, !dbg !118
  %4 = load i8*, i8** %data, align 8, !dbg !118
  %5 = call i64 @llvm.objectsize.i64.p0i8(i8* %4, i1 false, i1 true, i1 false), !dbg !118
  %call3 = call i8* @__memmove_chk(i8* noundef %3, i8* noundef %arraydecay1, i64 noundef %mul, i64 noundef %5) #5, !dbg !118
  %6 = load i8*, i8** %data, align 8, !dbg !119
  call void @printLine(i8* noundef %6), !dbg !120
  ret void, !dbg !121
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!11, !12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !9, line: 30, type: !10, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !6, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memmove_05-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5}
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !{!0, !7}
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !9, line: 31, type: !10, isLocal: true, isDefinition: true)
!9 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memmove_05-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !{i32 7, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{i32 7, !"PIC Level", i32 2}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"Homebrew clang version 14.0.6"}
!18 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memmove_05_bad", scope: !9, file: !9, line: 35, type: !19, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !21)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !{}
!22 = !DILocalVariable(name: "data", scope: !18, file: !9, line: 37, type: !23)
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64)
!24 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!25 = !DILocation(line: 37, column: 12, scope: !18)
!26 = !DILocalVariable(name: "dataBadBuffer", scope: !18, file: !9, line: 38, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !24, size: 80, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 10)
!30 = !DILocation(line: 38, column: 10, scope: !18)
!31 = !DILocalVariable(name: "dataGoodBuffer", scope: !18, file: !9, line: 39, type: !32)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !24, size: 88, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 11)
!35 = !DILocation(line: 39, column: 10, scope: !18)
!36 = !DILocation(line: 40, column: 8, scope: !37)
!37 = distinct !DILexicalBlock(scope: !18, file: !9, line: 40, column: 8)
!38 = !DILocation(line: 40, column: 8, scope: !18)
!39 = !DILocation(line: 44, column: 16, scope: !40)
!40 = distinct !DILexicalBlock(scope: !37, file: !9, line: 41, column: 5)
!41 = !DILocation(line: 44, column: 14, scope: !40)
!42 = !DILocation(line: 45, column: 9, scope: !40)
!43 = !DILocation(line: 45, column: 17, scope: !40)
!44 = !DILocation(line: 46, column: 5, scope: !40)
!45 = !DILocalVariable(name: "source", scope: !46, file: !9, line: 48, type: !32)
!46 = distinct !DILexicalBlock(scope: !18, file: !9, line: 47, column: 5)
!47 = !DILocation(line: 48, column: 14, scope: !46)
!48 = !DILocation(line: 51, column: 9, scope: !46)
!49 = !DILocation(line: 52, column: 19, scope: !46)
!50 = !DILocation(line: 52, column: 9, scope: !46)
!51 = !DILocation(line: 54, column: 1, scope: !18)
!52 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memmove_05_good", scope: !9, file: !9, line: 109, type: !19, scopeLine: 110, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !21)
!53 = !DILocation(line: 111, column: 5, scope: !52)
!54 = !DILocation(line: 112, column: 5, scope: !52)
!55 = !DILocation(line: 113, column: 1, scope: !52)
!56 = distinct !DISubprogram(name: "main", scope: !9, file: !9, line: 125, type: !57, scopeLine: 126, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !21)
!57 = !DISubroutineType(types: !58)
!58 = !{!10, !10, !59}
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!60 = !DILocalVariable(name: "argc", arg: 1, scope: !56, file: !9, line: 125, type: !10)
!61 = !DILocation(line: 125, column: 14, scope: !56)
!62 = !DILocalVariable(name: "argv", arg: 2, scope: !56, file: !9, line: 125, type: !59)
!63 = !DILocation(line: 125, column: 27, scope: !56)
!64 = !DILocation(line: 128, column: 22, scope: !56)
!65 = !DILocation(line: 128, column: 12, scope: !56)
!66 = !DILocation(line: 128, column: 5, scope: !56)
!67 = !DILocation(line: 130, column: 5, scope: !56)
!68 = !DILocation(line: 131, column: 5, scope: !56)
!69 = !DILocation(line: 132, column: 5, scope: !56)
!70 = !DILocation(line: 135, column: 5, scope: !56)
!71 = !DILocation(line: 136, column: 5, scope: !56)
!72 = !DILocation(line: 137, column: 5, scope: !56)
!73 = !DILocation(line: 139, column: 5, scope: !56)
!74 = distinct !DISubprogram(name: "goodG2B1", scope: !9, file: !9, line: 61, type: !19, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !21)
!75 = !DILocalVariable(name: "data", scope: !74, file: !9, line: 63, type: !23)
!76 = !DILocation(line: 63, column: 12, scope: !74)
!77 = !DILocalVariable(name: "dataBadBuffer", scope: !74, file: !9, line: 64, type: !27)
!78 = !DILocation(line: 64, column: 10, scope: !74)
!79 = !DILocalVariable(name: "dataGoodBuffer", scope: !74, file: !9, line: 65, type: !32)
!80 = !DILocation(line: 65, column: 10, scope: !74)
!81 = !DILocation(line: 66, column: 8, scope: !82)
!82 = distinct !DILexicalBlock(scope: !74, file: !9, line: 66, column: 8)
!83 = !DILocation(line: 66, column: 8, scope: !74)
!84 = !DILocation(line: 69, column: 9, scope: !85)
!85 = distinct !DILexicalBlock(scope: !82, file: !9, line: 67, column: 5)
!86 = !DILocation(line: 70, column: 5, scope: !85)
!87 = !DILocation(line: 75, column: 16, scope: !88)
!88 = distinct !DILexicalBlock(scope: !82, file: !9, line: 72, column: 5)
!89 = !DILocation(line: 75, column: 14, scope: !88)
!90 = !DILocation(line: 76, column: 9, scope: !88)
!91 = !DILocation(line: 76, column: 17, scope: !88)
!92 = !DILocalVariable(name: "source", scope: !93, file: !9, line: 79, type: !32)
!93 = distinct !DILexicalBlock(scope: !74, file: !9, line: 78, column: 5)
!94 = !DILocation(line: 79, column: 14, scope: !93)
!95 = !DILocation(line: 82, column: 9, scope: !93)
!96 = !DILocation(line: 83, column: 19, scope: !93)
!97 = !DILocation(line: 83, column: 9, scope: !93)
!98 = !DILocation(line: 85, column: 1, scope: !74)
!99 = distinct !DISubprogram(name: "goodG2B2", scope: !9, file: !9, line: 88, type: !19, scopeLine: 89, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !21)
!100 = !DILocalVariable(name: "data", scope: !99, file: !9, line: 90, type: !23)
!101 = !DILocation(line: 90, column: 12, scope: !99)
!102 = !DILocalVariable(name: "dataBadBuffer", scope: !99, file: !9, line: 91, type: !27)
!103 = !DILocation(line: 91, column: 10, scope: !99)
!104 = !DILocalVariable(name: "dataGoodBuffer", scope: !99, file: !9, line: 92, type: !32)
!105 = !DILocation(line: 92, column: 10, scope: !99)
!106 = !DILocation(line: 93, column: 8, scope: !107)
!107 = distinct !DILexicalBlock(scope: !99, file: !9, line: 93, column: 8)
!108 = !DILocation(line: 93, column: 8, scope: !99)
!109 = !DILocation(line: 97, column: 16, scope: !110)
!110 = distinct !DILexicalBlock(scope: !107, file: !9, line: 94, column: 5)
!111 = !DILocation(line: 97, column: 14, scope: !110)
!112 = !DILocation(line: 98, column: 9, scope: !110)
!113 = !DILocation(line: 98, column: 17, scope: !110)
!114 = !DILocation(line: 99, column: 5, scope: !110)
!115 = !DILocalVariable(name: "source", scope: !116, file: !9, line: 101, type: !32)
!116 = distinct !DILexicalBlock(scope: !99, file: !9, line: 100, column: 5)
!117 = !DILocation(line: 101, column: 14, scope: !116)
!118 = !DILocation(line: 104, column: 9, scope: !116)
!119 = !DILocation(line: 105, column: 19, scope: !116)
!120 = !DILocation(line: 105, column: 9, scope: !116)
!121 = !DILocation(line: 107, column: 1, scope: !99)
