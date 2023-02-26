; ModuleID = 'mac_bc/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_23-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_23-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [4 x i8] c"%1c\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"aaaaa %d aaaaa\0A\00", align 1
@.str.2 = private unnamed_addr constant [6 x i8] c"%s %d\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !11 {
entry:
  %retval = alloca i32, align 4
  %buffer = alloca i8*, align 8
  %ch = alloca i8, align 1
  %a = alloca i32, align 4
  %nb = alloca [10 x i8], align 1
  %b = alloca i32, align 4
  %newBuffer = alloca [50 x i32], align 16
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i8** %buffer, metadata !15, metadata !DIExpression()), !dbg !18
  %call = call i8* @malloc(i64 noundef 50) #4, !dbg !19
  store i8* %call, i8** %buffer, align 8, !dbg !18
  call void @llvm.dbg.declare(metadata i8* %ch, metadata !20, metadata !DIExpression()), !dbg !21
  %call1 = call i32 (i8*, ...) @scanf(i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i8* noundef %ch), !dbg !22
  call void @llvm.dbg.declare(metadata i32* %a, metadata !23, metadata !DIExpression()), !dbg !24
  %0 = load i8, i8* %ch, align 1, !dbg !25
  %conv = sext i8 %0 to i32, !dbg !26
  store i32 %conv, i32* %a, align 4, !dbg !24
  %1 = load i8*, i8** %buffer, align 8, !dbg !27
  %2 = load i8*, i8** %buffer, align 8, !dbg !27
  %3 = call i64 @llvm.objectsize.i64.p0i8(i8* %2, i1 false, i1 true, i1 false), !dbg !27
  %4 = load i32, i32* %a, align 4, !dbg !27
  %call2 = call i32 (i8*, i64, i32, i64, i8*, ...) @__snprintf_chk(i8* noundef %1, i64 noundef 50, i32 noundef 0, i64 noundef %3, i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0), i32 noundef %4), !dbg !27
  call void @llvm.dbg.declare(metadata [10 x i8]* %nb, metadata !28, metadata !DIExpression()), !dbg !32
  call void @llvm.dbg.declare(metadata i32* %b, metadata !33, metadata !DIExpression()), !dbg !34
  %5 = load i8*, i8** %buffer, align 8, !dbg !35
  %arraydecay = getelementptr inbounds [10 x i8], [10 x i8]* %nb, i64 0, i64 0, !dbg !36
  %call3 = call i32 (i8*, i8*, ...) @sscanf(i8* noundef %5, i8* noundef getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i64 0, i64 0), i8* noundef %arraydecay, i32* noundef %b), !dbg !37
  call void @llvm.dbg.declare(metadata [50 x i32]* %newBuffer, metadata !38, metadata !DIExpression()), !dbg !42
  %6 = load i32, i32* %a, align 4, !dbg !43
  %cmp = icmp slt i32 %6, 0, !dbg !45
  br i1 %cmp, label %if.then, label %lor.lhs.false, !dbg !46

lor.lhs.false:                                    ; preds = %entry
  %7 = load i32, i32* %a, align 4, !dbg !47
  %cmp5 = icmp sge i32 %7, 128, !dbg !48
  br i1 %cmp5, label %if.then, label %if.else, !dbg !49

if.then:                                          ; preds = %lor.lhs.false, %entry
  %8 = load i32, i32* %b, align 4, !dbg !50
  %idxprom = sext i32 %8 to i64, !dbg !52
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %newBuffer, i64 0, i64 %idxprom, !dbg !52
  store i32 1, i32* %arrayidx, align 4, !dbg !53
  br label %if.end, !dbg !54

if.else:                                          ; preds = %lor.lhs.false
  %9 = load i32, i32* %b, align 4, !dbg !55
  %idxprom7 = sext i32 %9 to i64, !dbg !57
  %arrayidx8 = getelementptr inbounds [50 x i32], [50 x i32]* %newBuffer, i64 0, i64 %idxprom7, !dbg !57
  store i32 1, i32* %arrayidx8, align 4, !dbg !58
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %10 = load i32, i32* %retval, align 4, !dbg !59
  ret i32 %10, !dbg !59
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #2

declare i32 @scanf(i8* noundef, ...) #3

declare i32 @__snprintf_chk(i8* noundef, i64 noundef, i32 noundef, i64 noundef, i8* noundef, ...) #3

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare i32 @sscanf(i8* noundef, i8* noundef, ...) #3

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { allocsize(0) }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_23-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 7, type: !13, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!12 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_23-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !2)
!14 = !{}
!15 = !DILocalVariable(name: "buffer", scope: !11, file: !12, line: 8, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 8, column: 8, scope: !11)
!19 = !DILocation(line: 8, column: 17, scope: !11)
!20 = !DILocalVariable(name: "ch", scope: !11, file: !12, line: 9, type: !17)
!21 = !DILocation(line: 9, column: 7, scope: !11)
!22 = !DILocation(line: 10, column: 5, scope: !11)
!23 = !DILocalVariable(name: "a", scope: !11, file: !12, line: 11, type: !3)
!24 = !DILocation(line: 11, column: 6, scope: !11)
!25 = !DILocation(line: 11, column: 15, scope: !11)
!26 = !DILocation(line: 11, column: 10, scope: !11)
!27 = !DILocation(line: 13, column: 2, scope: !11)
!28 = !DILocalVariable(name: "nb", scope: !11, file: !12, line: 15, type: !29)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 80, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 10)
!32 = !DILocation(line: 15, column: 7, scope: !11)
!33 = !DILocalVariable(name: "b", scope: !11, file: !12, line: 16, type: !3)
!34 = !DILocation(line: 16, column: 9, scope: !11)
!35 = !DILocation(line: 17, column: 12, scope: !11)
!36 = !DILocation(line: 17, column: 29, scope: !11)
!37 = !DILocation(line: 17, column: 5, scope: !11)
!38 = !DILocalVariable(name: "newBuffer", scope: !11, file: !12, line: 19, type: !39)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !3, size: 1600, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 50)
!42 = !DILocation(line: 19, column: 6, scope: !11)
!43 = !DILocation(line: 20, column: 5, scope: !44)
!44 = distinct !DILexicalBlock(scope: !11, file: !12, line: 20, column: 5)
!45 = !DILocation(line: 20, column: 7, scope: !44)
!46 = !DILocation(line: 20, column: 11, scope: !44)
!47 = !DILocation(line: 20, column: 14, scope: !44)
!48 = !DILocation(line: 20, column: 16, scope: !44)
!49 = !DILocation(line: 20, column: 5, scope: !11)
!50 = !DILocation(line: 21, column: 13, scope: !51)
!51 = distinct !DILexicalBlock(scope: !44, file: !12, line: 20, column: 24)
!52 = !DILocation(line: 21, column: 3, scope: !51)
!53 = !DILocation(line: 21, column: 16, scope: !51)
!54 = !DILocation(line: 22, column: 2, scope: !51)
!55 = !DILocation(line: 24, column: 13, scope: !56)
!56 = distinct !DILexicalBlock(scope: !44, file: !12, line: 23, column: 7)
!57 = !DILocation(line: 24, column: 3, scope: !56)
!58 = !DILocation(line: 24, column: 16, scope: !56)
!59 = !DILocation(line: 26, column: 1, scope: !11)
